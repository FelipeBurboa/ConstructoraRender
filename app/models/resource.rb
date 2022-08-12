class Resource < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :construction_resources
  has_many :constructions, through: :construction_resources
end
