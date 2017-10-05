class CreateNotepads < ActiveRecord::Migration
  def change
    create_table :notepads do |t|
      t.string :name
      t.text :content_data
      t.references :user, index: true

      t.timestamps
    end
  end
end
