class User < ApplicationRecord
	has_many :posts, dependent: :destroy

	validates :name, presence: true
    validates :login, presence: true, uniqueness: true
end
