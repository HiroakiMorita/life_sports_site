class CommentsController < ApplicationController
  # before_action :set_group

  def index
    @comment = Comment.new
    # @comments = @group.comments.includes(:user)
    # binding.pry
  end

  def create
    @comment = Comment.create(comment_params)
    # @comment = Comment.find_or_create_by!(comment_params)
    # @comments = current_user.id
    # binding.pry
    if @comment.save(comment_params) 
      redirect_to mypage_comments_path(@user)
    else
      render mypage_comments_path(@user)
    end
    # @comment.group = Group.find(params[:group_id])
    # if @comment.save
    #   respond_to do |format|
    #     format.html {redirect_to group_messages_path(params[:group_id])}
    #     format.json
    #   end
    # else
    #   redirect_to group_messages_path(params[:group_id])
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :image).merge(user_id: current_user.id)
  end

  # def set_group
  #   @group = Group.find(params[:group_id])
  #   Time.zone ='Tokyo'
  # end
end
