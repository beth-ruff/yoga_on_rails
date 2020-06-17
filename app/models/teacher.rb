class Teacher < ApplicationRecord
    has_many :classes
    belongs_to :studio
    
end
