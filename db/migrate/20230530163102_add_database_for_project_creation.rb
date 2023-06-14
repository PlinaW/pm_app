class AddDatabaseForProjectCreation < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.string :status
      t.date :start_date
      t.date :end_date
      t.timestamps
    end

    create_table :epics do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :context
      t.string :status
      t.integer :priority
      t.timestamps
    end 

    create_table :user_stories do |t|
      t.references :epic, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.string :status
      t.integer :priority
      t.timestamps
    end 
  
    create_table :sprints do |t|
      t.string :name, null: false
      t.string :goal
      t.date :start_date
      t.date :end_date
      t.timestamps
    end 
    
    create_table :tasks do |t|
      t.references :user_story, index: true, foreign_key: true
      t.references :sprint, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :status
      t.integer :priority
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end 
  end
end
