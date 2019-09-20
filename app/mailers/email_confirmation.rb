class EmailConfirmation < ActionMailer::Base
  default from: "Swaziland Tourism Authority <new-user@realsms.co.sz>"

  def confirm_user_signup(user)

    @user = user
    mail(:to => "tnt501muzinjomane@gmail.com",  :subject => "Swaziland Tourism Authority Pass Code") do |format|
      format.html { render 'email_confirmation/confirm_user_signup' }
    end
  end

end
