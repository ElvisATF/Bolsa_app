class CreateUserEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_entities do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :confirmation_password
      t.string :address
      t.string :postal_cod
      t.integer :contact
      t.integer :nif
      t.string :locality
      t.string :professional_activity
      t.string :presentation

      t.timestamps
    end
  end
end
