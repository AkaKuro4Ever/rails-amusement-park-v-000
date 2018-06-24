module LoginHelper

  def user_signup
    @user = User.new(user_params)

    if !@user.save
      redirect_to root_path
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def user_login
    @user = User.find_by(name: params[:name])
    if @user.try.(:authenticate, params[:password]).nil?
      redirect_to root_path
    end
    session[:user_id] = @user.id
  end

end
