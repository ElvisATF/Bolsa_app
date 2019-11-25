class AddResetToUserEntities < ActiveRecord::Migration[6.0]
  def change
    add_column :user_entities, :reset_digest, :string
    add_column :user_entities, :reset_sent_at, :datetime
  end
end
