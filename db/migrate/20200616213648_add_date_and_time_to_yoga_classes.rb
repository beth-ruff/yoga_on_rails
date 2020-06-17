class AddDateAndTimeToYogaClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :yoga_classes, :date, :date 
    add_column :yoga_classes, :time, :time 
  end
end
