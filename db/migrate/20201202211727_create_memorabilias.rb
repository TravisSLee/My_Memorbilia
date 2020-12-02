class CreateMemorabilias < ActiveRecord::Migration[6.0]
  def change
    create_table :memorabilias do |t|
      t.integer :user_id
      t.integer :athlete_id
      t.boolean :autographed
      t.string :item_type
    end
  end
end
