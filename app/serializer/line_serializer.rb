class LineSerializer < ActiveModel::Serializer
  attributes :name, :color, :direction, :id #added name
  has_many :comments

end
