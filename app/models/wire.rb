class Wire < ActiveRecord::Base
	belongs_to :user
	has_many :interests

	validates :title, presence: true, length: { minimum: 2 }
  # It validates the frequency, but the user has no idea what to set!
  # Consider changing your view to include a select box for frequency
    validates :frequency, presence: true
    
end
