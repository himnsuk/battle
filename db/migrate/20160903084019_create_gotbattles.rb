class CreateGotbattles < ActiveRecord::Migration
  def change
    create_table :gotbattles do |t|
      t.string :name
      t.integer :year
      t.integer :battle_number
      t.string :attacker_king
      t.string :defender_king
      t.string :attacker_outcome
      t.string :bettle_type
      t.integer :major_death
      t.integer :major_capture
      t.integer :attacker_size
      t.integer :defender_size
      t.string :attacker_commander
      t.string :defender_commander
      t.integer :summer
      t.string :location
      t.string :region
      t.text :note

      t.timestamps null: false
    end
  end
end
