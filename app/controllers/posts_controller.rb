class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.user_id = current_user.id if current_user

    if @post.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
