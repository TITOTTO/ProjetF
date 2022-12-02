class Addcoltoorder < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :order, foreign_key: true, optional: true
    add_reference :orders, :user, foreign_key: true
    add_column :orders, :amount, :integer
  end
end
