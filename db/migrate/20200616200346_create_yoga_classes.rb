class CreateYogaClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :yoga_classes do |t|
      t.string :name
      t.integer :length
      t.string :difficulty
      t.integer :user_id
      t.integer :studio_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
