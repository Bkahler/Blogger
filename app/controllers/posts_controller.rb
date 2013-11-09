class PostsController < ApplicationController

  def index
    posts = Post.all
    pictures = Picture.all
    @blog_post = posts + pictures
    @blog_post.sort!{|a,b| b.created_at <=> a.created_at}
  end

  def create
    @post = Post.create(params[:post])
    render json: @post
  end

end
