class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        if auth_hash = request.env['omniauth.auth']
            oauth_email = request.env['omniauth.auth']['info']['email']
            if @user = User.find_by(:email => oauth_email)
                session[:user_id] = @user.id
                redirect_to events_path
            else
                @user = User.new(:email => oauth_email, :password => SecureRandom.hex)
                if @user.save
                    session[:user_id] = @user.id
                    redirect_to events_path
                else
                    render :new
                end
            end
        else
            @user = User.find_by(email: params[:user][:email])
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to events_path
            else
                render :new
            end
        end     
    end

    def destroy
        # session.delete :username
        reset_session
        redirect_to new_session_path 
    end

end