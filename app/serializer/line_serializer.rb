class LineSerializer < ActiveModel::Serializer
  attributes :color, :direction, :id
  has_many :comments

end
