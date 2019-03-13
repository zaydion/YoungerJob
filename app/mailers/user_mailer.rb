class UserMailer < ApplicationMailer
  def interested_email
    @user = params[:user]
    @post = params[:post]
    @company = params[:company]
    @subject = params[:subject]
    @body = params[:body]
    filename = @user.resume.filename.to_s
    attachments["#{filename}"] = { mime_type: @user.resume.content_type, content: @user.resume.download }
    @user_url  = "https://youngerjob.herokuapp.com/users/#{@user.id}"
    @post_url = "https://youngerjob.herokuapp.com/companies/#{@company.id}/posts/#{@post.id}"
    mail(to: @company.email, subject: @subject, body: @body)
  end
end
