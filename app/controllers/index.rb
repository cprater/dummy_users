get '/' do
  erb :index
end

get '/secret' do
  erb :secret
end

get '/create_account' do
  erb :create_account
end


#POST=========================

post '/login' do
  @test_info = User.find_by_user_name(params[:user][:user_name])
  if @test_info.authenticate(params[:user][:password])
    redirect '/secret'
  else
    redirect '/'
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


