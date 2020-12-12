class AddPriceToMemorabilias < ActiveRecord::Migration[6.0]
  def change
    add_column :memorabilias, :price, :decimal, precision: 10, scale: 2
  end
end
