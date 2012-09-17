class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role_type
      t.references :dvd
      t.references :person

      t.timestamps
    end
    add_index :roles, :dvd_id
    add_index :roles, :person_id
  end
end
