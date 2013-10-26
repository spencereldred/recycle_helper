class Hi5Mailer < ActionMailer::Base
  default from: "eldredspencer@gmail.com"

  def welcome_user(user)
    @user = user
    @url = 'http://localhost:3000/sessions/new' # the web site url, for a link to login to your site
    mail(to: @user.email, subject: 'Welcome to Hi5 Exchange')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hi5_mailer.created.subject
  #
  def created
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hi5_mailer.selected.subject
  #
  def selected
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hi5_mailer.closed.subject
  #
  def closed
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
