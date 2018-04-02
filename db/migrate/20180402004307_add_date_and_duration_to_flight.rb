class AddDateAndDurationToFlight < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :date, :datetime
    add_column :flights, :duration, :integer
  end
end
