get '/' do
  erb :index
end

get '/secret' do
  #signout/secretpage
  "booyah"
end

get '/create_account' do
  #create page
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
  User.create(params[:user])
end


