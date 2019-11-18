class AddPasswordDigestToUserEnts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_ents, :password_digest, :string
  end
end
