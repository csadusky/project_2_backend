class CommentSerializer < ActiveModel::Serializer
  attributes :post, :emoji, :time
  has_one :user

  # attribute :user, :key => :username

  # def comm_params
  #   params.require(:post).permit(:emoji)
  # end

  def time
    object.created_at.strftime('%I:%M %p')
  end
end


