class AddPasswordDigestToUserEntities < ActiveRecord::Migration[6.0]
  def change
    add_column :user_entities, :password_digest, :string
  end
end
