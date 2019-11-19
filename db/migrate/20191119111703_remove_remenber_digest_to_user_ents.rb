class RemoveRemenberDigestToUserEnts < ActiveRecord::Migration[6.0]
  def change
  	remove_column :user_ents, :remenber_digest, :string
  end
end
