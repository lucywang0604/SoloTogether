class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :visitor, :local, :update]

  def index
    @profiles = Profile
                  .joins(:current_city)
                  .near(current_profile.current_city, 10)
                  .where.not(id: current_profile.id)

    # Apply filters if present
    if params[:min_age].present?
      min_birthdate = Date.current - params[:min_age].to_i.years
      @profiles = @profiles.where('birthdate <= ?', min_birthdate)
    end

    if params[:max_age].present?
      max_birthdate = Date.current - params[:max_age].to_i.years
      @profiles = @profiles.where('birthdate >= ?', max_birthdate)
    end

    if params[:sex].present?
      @profiles = @profiles.where(sex: params[:sex])
    end

    if params[:spoken_languages].present?
      @profiles = @profiles.where('spoken_languages @> ARRAY[?]::varchar[]', params[:spoken_languages])
    end
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def me
    @profile = current_user.profile
  end

  def visitor
    @profile.visitor!
    redirect_to me_path
  end

  def local
    @profile.local!
    redirect_to me_path
  end

  def update
    if @profile.update(profile_params)
      if request.format.json?
        render json: {
          biography: @profile.biography,
          age: @profile.age,
          sex: @profile.sex,
          spoken_languages: @profile.spoken_languages
        }
      else
        redirect_to me_path
      end
    else
      if request.format.json?
        render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :biography, :birthdate, :current_city_id, :original_city_id, :sex, :avatar, :mode, spoken_languages: [])
  end
end
