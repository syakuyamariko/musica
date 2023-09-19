class Admin::SearchesController < ApplicationController
  # before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @users = User.all
    @posts = Post.all
    @post_comments = PostComment.all

    # 選択したモデルに応じて適切なモデルを選択
    @records = if @model == "user"
                  User.search_for(@content, @method).page(params[:page])
               elsif @model == "post"
                  Post.search_for(@content, @method).page(params[:page])
               elsif @model == "post_comment"
                  PostComment.search_for(@content, @method).page(params[:page])
               else
                  # モデルが認識されない場合の処理、空の配列を代入
                  []
               end
  end
end
