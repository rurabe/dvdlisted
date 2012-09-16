class ChangeAsinToString < ActiveRecord::Migration
  def change
 		remove_column :dvds, :asin
 		add_column :dvds, :asin, :string
  end
end
