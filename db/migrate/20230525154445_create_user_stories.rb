class CreateUserStories < ActiveRecord::Migration[7.0]
  def change
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.integer :points
      t.string :status
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
