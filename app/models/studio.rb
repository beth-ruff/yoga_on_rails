class Studio < ApplicationRecord
    has_many :yoga_classes 
    has_many :users, through: :yoga_classes 
    validates :name, presence: true, uniqueness: true
    validates :address, presence: true
    validates :phone_number, length: { minimum: 10 }
end
