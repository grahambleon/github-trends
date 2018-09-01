class Repo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :contributions
  has_many :contributors, through: :contributions
end
