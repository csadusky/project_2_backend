class CommentSerializer < ActiveModel::Serializer
  attributes :post, :emoji, :time
  has_one :user

  def time
    object.created_at.strftime('%b %e, %l:%M %p')
  end
end


