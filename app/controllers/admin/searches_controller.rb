class Admin::SearchesController < ApplicationController

  #before_action :authenticate_user!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @users = User.all
    @posts = Post.all

    # 選択したモデルに応じて検索を実行
    if @model  == "user"
      @records = User.search_for(@content, @method).page(params[:page])
    else
      @records = Post.search_for(@content, @method).page(params[:page])
    end
  end

end

