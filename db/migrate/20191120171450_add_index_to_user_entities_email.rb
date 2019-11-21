class AddIndexToUserEntitiesEmail < ActiveRecord::Migration[6.0]
  def change
  	add_index :user_entities, :email, unique: true
  end
end

