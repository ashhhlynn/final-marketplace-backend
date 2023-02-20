class AddColumnsToProducts < ActiveRecord::Migration[6.1]
    def change
      add_column :products, :sold, :boolean
      add_column :products, :buyer, :string
    end
  end


