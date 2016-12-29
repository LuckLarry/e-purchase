class SessionsController < ApplicationController
  skip_before_filter :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    render :layout => false 
  end

  def create
    user = User.find_by_username(params[:username])
    if user and user.authenticate(params[:password])
      begin
        new_auth_token = SecureRandom.urlsafe_base64
      end while User.exists?(:auth_token => new_auth_token)
      user.update(auth_token: new_auth_token)
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
	cookies[:auth_token] = user.auth_token
      end
      if User.find(user.id).admin
        redirect_to providers_url
      else
        redirect_to new_product_path
      end
    else
      redirect_to login_path, alert: "帐号或密码输入错误"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "Logged out"
  end


 def update
    user_id=session[:user_id]
    user = User.find(user_id)
    if user and user.authenticate(params[:user][:password])
	params[:user][:password] = params[:user][:username]
    respond_to do |format|
      if @user.update(user_params)
        format.html {
          redirect_to products_url+"/new",
          notice: '修改成功！'
        }
      else
        format.html { render :UpdatePassword }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end
    else
      
      redirect_to :UpdatePassword, alert: "旧密码输入错误"
    end
 end


 private
 # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(session[:user_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :password)
    end
end

