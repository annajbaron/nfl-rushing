class Position < ApplicationRecord
	has_many :players

	validates :name, uniqueness: true
	validates :abbreviation, uniqueness: true
end