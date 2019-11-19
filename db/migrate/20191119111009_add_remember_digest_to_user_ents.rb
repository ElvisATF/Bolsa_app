class AddRememberDigestToUserEnts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_ents, :remember_digest, :string
  end
end
