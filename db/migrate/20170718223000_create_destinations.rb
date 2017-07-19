class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.column :name, :string
      t.column :country, :string
      t.column :city, :string
      t.column :review, :string

      t.timestamps
    end
  end
end
