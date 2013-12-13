class Hi5Mailer < ActionMailer::Base
  default from: "eldredspencer@gmail.com"

  def welcome_user(user)
    @user = user
    @url = 'http://localhost:3000/sessions/new' # the web site url, for a link to login to your site
    mail(to: @user.email, subject: 'Welcome to Hi5 Exchange')
  end

  def unselected(user)
    @user = user
    @greeting = "Aloha"

    mail(to: @user.email, subject: 'Recycle job has been unselected')
  end

  def selected(user)
    @user = user
    @greeting = "Aloha"

    mail(to: @user.email, subject: 'Recycle job has been selected')
  end

  def completed(user)
    @user = user
    @greeting = "Aloha"

    mail(to: @user.email, subject: 'Recycle job has been completed')
  end
end
