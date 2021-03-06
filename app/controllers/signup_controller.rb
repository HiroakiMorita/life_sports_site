class SignupController < ApplicationController
  
  def index
  end

  def step1
    @user = User.new # 新規インスタンス作成
    @profile = Profile.new
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:old] = profile_params[:old]
    session[:gender] = profile_params[:gender]
    @user = User.new # 新規インスタンス作成
    @profile = Profile.new
    # binding.pry
  end

  def done
    profile_params[:job]
    profile_params[:holiday]
    profile_params[:message]
    profile_params[:prefecture_id]
    @user = User.new # 新規インスタンス作成
    @profile = Profile.new
  end

  def create
    if session[:uid].present? && session[:provider].present?
      password = Devise.friendly_token.first(7)
      @user = User.create(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password]
      )
      @sns = SnsCredential.create(
        uid: session[:uid],
        provider: session[:provider],
        user_id: @user.id
      )
    end
      unless @user.save
        reset_session
        redirect_to signup_index_path
        return
      end
      @profile = Profile.create(
        user: @user,
        old: session[:old],
        gender: session[:gender],
        job: profile_params[:job],
        holiday: profile_params[:holiday],
        message: profile_params[:message],
        prefecture_id: profile_params[:prefecture_id]
      )
      # binding.pry
    if @user.save
      # ログインするための情報を保管
        session[:id] = @user.id
        redirect_to  '/signup/done'
      else
        render '/signup/step1'
      end
    end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
    end



  private
# 許可するキーを設定します
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation
  )
  end

  def profile_params
    # binding.pry
    params.require(:profile).permit(
      :old,
      :gender,
      :job,
      :holiday,
      :message,
      :prefecture_id
  )
  end
end
