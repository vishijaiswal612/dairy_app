class Milkman < ApplicationRecord
	belongs_to :user
	has_one :white_label_app
end
