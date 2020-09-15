class UserMailer < ApplicationMailer
    def create_user(user, password)
      @user = user
      @password = password
      @email = @user.email
      mail(to: @email, subject: "Cuenta de usuario TOPOSERVIS")
    end
end
