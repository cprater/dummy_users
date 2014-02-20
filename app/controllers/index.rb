get '/' do
  erb :welcome
end

get '/urls' do
  erb :url_index
end

get '/users' do
  erb :user_index
end

get '/secret' do
  erb :secret
end

get '/create_account' do
  erb :create_account
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  Url.increment_counter(:click_count, @url.id)
  redirect @url.original_url
end

#POST=========================

post '/login' do
  @test_info = User.find_by_user_name(params[:user][:user_name])  
  if @test_info == nil
    @invalid = true
    erb :user_index
  else
    if @test_info.authenticate(params[:user][:password])
      redirect '/secret'
    else
      @invalid = true
      erb :user_index
    end
  end
end

post '/create_account' do
  user = User.new(params[:user])
  if user.check_validation
    @invalid = true
    erb :create_account
  else
    user.save
    redirect '/secret'
  end
end

post '/urls' do
  @new_url = Url.new(original_url: params[:original_url])
  if @new_url.check_validation
    @invalid = true
    erb :index
  else
    @new_url.save
    erb :display_short
  end
end


