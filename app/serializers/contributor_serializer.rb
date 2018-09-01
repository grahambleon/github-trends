class ContributorSerializer < ActiveModel::Serializer
  attributes :name

  has_many :repos
end
