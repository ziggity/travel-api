class AddRatingToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :rating, :integer
  end
end
