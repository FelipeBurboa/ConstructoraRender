class Brand < ApplicationRecord
    has_many :resources, dependent: :delete_all
    validates :name, presence: true
    has_one_attached :photo
end
