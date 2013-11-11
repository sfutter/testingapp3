class Wire < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 2 }
    validates :frequency, presence: true
end
