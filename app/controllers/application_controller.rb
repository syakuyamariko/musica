class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top, :about ]#ログイン認証が済んでいない状態でトップページ以外の画面にアクセスしても、ログイン画面へリダイレクトする
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
add_flash_types :success, :info, :warning, :danger

  def configure_permitted_parameters
#     if resource_class == User
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :account_id, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:account_id])
#     end
  end
end
