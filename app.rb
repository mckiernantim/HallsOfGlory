require 'sinatra'

require 'shotgun'

require 'mailgun'

require './models'
# a cookie for login info 
set :session_secret, ENV['HALL_PASS']
enable :sessions

get('/') do
   
    erb :index
end

get('/dashboard')do
current_user = session[:user_id]
if current_user.nil? 
    return redirect'/'
end
@current_user = User.find(current_user)

erb :dashboard

end

get('/login') do
    erb :login
end

get('/sign_up') do
    erb :sign_up
end


get('/create') do
    erb :create  
end

get('/logout') do
    session[:user_id] = nil
    redirect ('/')
end


post('/sign_up') do
    this_user = User.find_by(email: params[:user_email])
        if this_user != nil
            return redirect '/login'
    end

    this_user = User.create(
        f_name:  params[:user_f_name],
        l_name: params[:user_l_name],
        email:  params[:user_email],
        password: params[:user_password]
    )
        session[:user_id] = this_user.id

    redirect('/')
    end

post('/login') do
    
    this_user = User.find_by(email: params[:user_email])
    if this_user.nil?
        return redirect('/login')
    end
    
    unless this_user.password == params[:password]
        return redirect('/login')
    end
    session[:user_id] = this_user.id
    
    return redirect ('/dashboard')
   
end

   


post('/create') do
    this_post = Post.create(
        name:  params[:post_name],
        body: params[:post_body],
        # tag: params[:tags],
        preview: params[:post_body].truncate(20),
         author_id: session[:user_id]
    )
  
        
        
        redirect ('dashboard')

   
end



   



