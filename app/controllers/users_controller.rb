class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def invite
    email = params[:email]
    return redirect_to users_path, alert: 'No email provided' if email.blank?

    user = User.invite!({ email: }, current_user)
    return redirect_to users_path, alert: 'Email invalid' unless user.valid?

    redirect_to users_path, notice: "#{email} was invited"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "#{@user.full_name} was deleted"
  end

end
