class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.text :content
      t.references :user_entity, null: false, foreign_key: true

      t.timestamps
    end
    add_index :offers, [:user_entity_id, :created_at]
  end
end
