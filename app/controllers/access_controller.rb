class AccessController < ApplicationController
  
  layout 'admin'

  def menu
    #display text & links
  end

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username])  #uses hash syntax that will sanitize the query
      if found_user
        authorized_user = found_user.authenticate(params)
      end
    end

    if authorized_user            #if logged in successfully
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)     #goes to menu page
    
    else 
      flash.now[:noticce] = "Invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end

end
