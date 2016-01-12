class UserMailer < ApplicationMailer
	def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_up'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def dev_project(project)
    @project = project
    p "Project in USER MAILER"
    p @project
    @url = "http://localhost:3000/projects/#{@project.id}"
    p "URL"
    p @url
    p "PROJECT EMAIL CONTANCT"
    p @project.contact_email
    mail(to: @project.contact_email, subject: "Your project was selected")
  end
end
