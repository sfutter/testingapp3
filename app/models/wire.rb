class Wire < ActiveRecord::Base
	belongs_to :user
	has_many :interests

	validates :title, presence: true, length: { minimum: 2 }
    validates :frequency, presence: true
    
end
