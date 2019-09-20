class User::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
      flash[ :notice ] = 'New user has signed up successfully. The user will receive an email with the secret code via email. '
      EmailConfirmation.confirm_user_signup(@user).deliver
    end

  def update
    super
  end

end

