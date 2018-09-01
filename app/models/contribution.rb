class Contribution < ApplicationRecord
  belongs_to :contributor
  belongs_to :repo
end
