class AddRememberDigestToUserEntities < ActiveRecord::Migration[6.0]
  def change
    add_column :user_entities, :remember_digest, :string
  end
end
