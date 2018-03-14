class Story < ApplicationRecord
	has_and_belongs_to_many :users

	validates :title, uniqueness: true, presence: true
end
