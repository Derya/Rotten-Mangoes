class UserMailer < ApplicationMailer
  default from: 'notifications@rottenmangoes.com'

  def deletion_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'You have been deleted')
  end

end
