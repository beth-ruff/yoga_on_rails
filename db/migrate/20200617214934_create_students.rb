class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :yoga_class_id

      t.timestamps
    end
  end
end
