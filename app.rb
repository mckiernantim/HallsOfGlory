require 'sinatra'

require 'shotgun'

require 'mailgun'

require './models'
require 'byebug'

# a cookie for login info 
set :session_secret, ENV['HALL_PASS']
enable :sessions

get('/') do
   
    erb :index
end

get('/deleted') do
   
    erb :deleted
end

get('/deleted/:delete_id')do
@delete_id = params[:delete_id]


    erb :deleted
end
get('/delete_post/:post_id')do

  
   @this_post = Post.find(params[:post_id])
    
    @this_post.delete

    redirect ('/feed')

end
get('/delete_user/:user_id') do
    @this_user = User.find(session[:user_id])
   
   erb :delete_user
end

get('/confirm_delete/:user_id') do
    this_user = params[:user_id]
    User.delete(this_user)
    redirect ('/')
end
get('/profile')do



    erb :profile
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

get('/operatives')do
current_user = session[:user_id]
    if current_user.nil? 
        return redirect'/'
    end
    @operatives = User.all
    erb :operatives
   

end

get('/create') do
    current_user = session[:user_id]
    if current_user.nil? 
        return redirect'/'
    end
    erb :create  
end

get('/logout') do
    session[:user_id] = nil
    redirect ('/')
end

get('/feed') do
    @feed = Post.all.last(20)
    current_user = session[:user_id]
    if current_user.nil? 
        return redirect'/'
    end
    @current_user = User.find(current_user)
    erb :feed
end


get('/op/:op_number')do
 current_user = session[:user_id]
    if current_user.nil? 
    return redirect'/'
    end
    @id = params[:op_number].to_i

    erb :op
end

get('/post/:num')do
    current_user = User.find(session[:user_id])

    if current_user.nil? 
    return redirect'/'
    end
    @id = params[:num].to_i
    @this_post = Post.find(@id)
    erb :post
   
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
    
    return redirect ('/feed')
   
end

   


post('/create') do
    this_post = Post.create(
        name:  params[:post_name],
        body: params[:post_body],
        # tag: params[:tags],
        preview: params[:post_body].truncate(50),
         user_id: session[:user_id]
        #  time: Time.now
    )
    redirect ('/feed')
end


post('/save_image') do

    @filename = params[:file][:filename]
    file = params[:file][:tempfile]
  
    File.open("./public/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end
  
    redirect
  end

  get('/update/:post_id')do

  @current_user = User.find(session[:user_id])
  if @current_user.nil? 
    return redirect'/'
  end

  @this_post = Post.find(params[:post_id])
  erb :update
end


post('/update/:post_id')do
  
    @current_user = User.find(session[:user_id])
    post_to_update = Post.find(params[:post_id])

    post_to_update.update(
        :body => params[:post_body],
        :name => params[:post_name]
    )

    redirect ('/feed')
end


   



