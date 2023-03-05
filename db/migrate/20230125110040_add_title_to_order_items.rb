class AddTitleToOrderItems < ActiveRecord::Migration[6.1]
    def change
        add_column :order_items, :title, :string
    end
  end


