class CreateFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :features do |t|
      t.string :name
      t.text :description
      t.references :product_backlog, null: false, foreign_key: true
      t.references :sprint_backlog, null: true, foreign_key: true
      t.integer :priority
      t.string :status
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
