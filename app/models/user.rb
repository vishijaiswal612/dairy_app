class User < ApplicationRecord
	has_many :milkmen, dependent: :destroy
	has_many :white_label_apps, through: :milkmen, dependent: :destroy
end
