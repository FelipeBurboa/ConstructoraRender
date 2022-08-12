class Category < ApplicationRecord
    has_many :resources, dependent: :delete_all
    validates :name, presence: true
end
