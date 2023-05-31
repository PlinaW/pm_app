class AddDatabaseForProjectCreation < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, unique: true
      t.text :description
      t.string :status
      t.date :started_at
      t.date :ended_at
      t.timestamps
    end

    create_table :features do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name, unique: true
      t.text :description
      t.string :type
      t.string :status
      t.integer :priority
      t.text :comment
      t.string :created_by
      t.timestamps
    end 

    create_table :user_stories do |t|
      t.references :feature, index: true, foreign_key: true
      t.string :name, unique: true
      t.text :description
      t.string :status
      t.integer :priority
      t.text :comment
      t.string :created_by
      t.timestamps
    end 
  
    create_table :sprints do |t|
      t.string :name, unique: true
      t.text :goal
      t.string :created_by
      t.date :started_at
      t.date :ended_at
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
      t.text :comment
      t.string :created_by
      t.string :owner
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end 

  end
end
