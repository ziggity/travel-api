class AddReviewTable < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :content, :string
      t.column :destination_id, :integer

      t.timestamps
    end
    remove_column :destinations, :review, :string
  end
end
