class LineSerializer < ActiveModel::Serializer
  attributes :name, :color, :direction, :id
  has_many :comments

end
