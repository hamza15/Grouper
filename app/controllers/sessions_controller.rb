class SessionsController < ApplicationController

    def create
        if auth_hash = request.env["omniauth.auth"]
            raise auth_hash.inspect
        else
            user = User.find_by(email: params[:user][:email])
            if user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                flash[:message] = "Incorrect login or passowrd. Please login again."
                redirect_to "/login"
            end
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end