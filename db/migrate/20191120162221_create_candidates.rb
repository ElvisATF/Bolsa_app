class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :name
      t.string :address
      t.integer :postal_cod
      t.string :locality
      t.integer :contact
      t.string :identity_card
      t.string :professional_area
      t.string :presentation
      t.string :level_of_qualifications
      t.string :literary_abilities
      t.string :professional_situation
      t.string :professional_experience

      t.timestamps
    end
  end
end
