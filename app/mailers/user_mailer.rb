class UserMailer < ApplicationMailer
	def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_up'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def dev_project(project)
    @product = project
    @url = ''
    mail(to: @project.contact_mail, subject: "Your project was selected")
  end
end
