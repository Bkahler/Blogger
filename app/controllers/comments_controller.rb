class CommentsController < ApplicationController

  def index

  end

  def create
      if params[:post][:commentable_type] == "Post"
      @post = Post.find(params[:post_id])
      @post.comments.create(params[:post])

      render json:@post.comments
     else
      p params[:picture_id]
      @picture = Picture.find(params[:picture_id])
      @picture.comments.create(params[:post])

      render json:@picture.comments
     end
  end
end
