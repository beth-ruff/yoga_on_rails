class YogaClass < ApplicationRecord
    belongs_to :studio
    belongs_to :user
    has_many :students
    accepts_nested_attributes_for :studio, reject_if: :all_blank

    DIFFICULTY_LIST = ["Beginner", "Intermediate", "Expert", "All Levels"]

end
