class Studio < ApplicationRecord
    has_many :classes 
    has_many :users, through: :classes 
    has_many :teachers

end
