class AddPictureToDvd < ActiveRecord::Migration
  def change
    add_column :dvds, :picture, :string
  end
end
