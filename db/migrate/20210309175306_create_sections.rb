class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.belongs_to :page
      t.string :name
      t.integer :position
      t.boolean :visible
      t.text :content
      t.text :content_type
      t.timestamps
    end
  end
end
