class SessionsController < ApplicationController
  def new

  end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)             # フォームで入力されたparamsを＠userに代入
		if @user && @user.authenticate(params[:session][:password])                # 条件分岐
			if @user.activated?
				log_in @user                                                             # log_inメソッド内でsession[:user_id]に代入
				params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)  # チェックボックスにチェック入ればparamsに代入,rememberメソッド内でsessionの永続化
				redirect_back_or @user                                                   # リダイレクト処理
			else
				message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
			end
		else
			# エラーメッセージの表示
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
