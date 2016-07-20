class UserMailer < ApplicationMailer
  default from: 'notifications@rottenmangoes.com'

  def deletion_email(user)
    @user = user
    @url  = 'notifications@rottenmangoes.com'
    mail(to: @user.email, subject: 'You have been deleted')
  end

end
