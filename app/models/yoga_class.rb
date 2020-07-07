class YogaClass < ApplicationRecord
    belongs_to :studio
    belongs_to :user
    has_many :students
    validates :name, presence: true
    validates :length, presence: true
    validates :difficulty, presence: true
    validates :date, presence: true
    validates :time, presence: true
    validates :studio, presence: true
    accepts_nested_attributes_for :studio, reject_if: :all_blank
    scope :future_classes, -> { where('date >= ?', Date.today) }
    scope :past_classes, -> { where('date < ?', Date.today) }
    
    DIFFICULTY_LIST = ["Beginner", "Intermediate", "Advanced", "All Levels"]

    def yoga_class_date
        self.date.strftime('%A, %B %d, %Y')
    end 

end
