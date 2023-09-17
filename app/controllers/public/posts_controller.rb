class Public::PostsController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @user = current_user
    if @post.save
      redirect_to posts_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def index
#フォローしているユーザーと自分の投稿
    @posts = Post.where(user_id: [current_user.id, *current_user&.following_ids])
                .order(created_at: :desc)
    @post = Post.new
    @post.id = current_user.id
    @user = current_user
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @user = @post.user
    @post_new = Post.new
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(body: content)
    elsif method == 'forward'
      Post.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('name LIKE ?', '%' + content)
    else
      Post.where('name LIKE ?', '%' + content + '%')
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :post_image, :video)
  end

end