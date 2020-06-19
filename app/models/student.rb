class Student < ApplicationRecord
    belongs_to :yoga_class
    validates :name, presence: true
end
