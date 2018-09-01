class Contributor < ApplicationRecord
  validates :name, presence: true

  has_many :contributions
  has_many :repos, through: :contributions
end
