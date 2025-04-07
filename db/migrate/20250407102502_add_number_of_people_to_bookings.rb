class AddNumberOfPeopleToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :number_of_people, :integer
  end
end
