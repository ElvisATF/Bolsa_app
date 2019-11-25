class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.text :content
      t.references :user_entity, foreign_key: true
      t.string :professional_activity
      t.string :type_of_contract
      t.integer :salary
      t.string :title
      
      t.timestamps
    end
    add_index :offers, [:user_entity_id, :created_at]
  end
end
