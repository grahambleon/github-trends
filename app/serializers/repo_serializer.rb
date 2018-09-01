class RepoSerializer < ActiveModel::Serializer
  attributes :title, :description, :language

  has_many :contributors
end
