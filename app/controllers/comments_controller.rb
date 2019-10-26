class CommentsController < ApplicationController
  # before_action :set_group

  def index
    @comment = Comment.find_by(params[:id])
    # @comment = Comment.new
    # @comments = Comment.all
    # @comments = Comment.find_by(params[:mypage_id])
    # binding.pry
    # @comments = @group.comments.includes(:user)
  end

  
  def create
    # @comment = Comment.create(comment_params)
    @comment = Comment.create(
      content: comment_params[:content], # sessionに保存された値をインスタンスに渡す
      image: comment_params[:image]
      )
    @comment.user_id = current_user.id
    # @comment = Comment.find_or_create_by!(comment_params)
    # @comments = current_user.id
    # binding.pry
    if @comment.save(comment_params) 
      redirect_to mypage_comments_path(@comment)
    else
      render mypage_comments_path(@comment)
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
    params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end

  # def set_group
  #   @group = Group.find(params[:group_id])
  #   Time.zone ='Tokyo'
  # end
end
