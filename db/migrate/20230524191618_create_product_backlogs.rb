class CreateProductBacklogs < ActiveRecord::Migration[7.0]
  def change
    create_table :product_backlogs do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
