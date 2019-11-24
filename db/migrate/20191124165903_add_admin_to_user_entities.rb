class AddAdminToUserEntities < ActiveRecord::Migration[6.0]
  def change
    add_column :user_entities, :admin, :boolean
  end
end
