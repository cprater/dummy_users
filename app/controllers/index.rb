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

  redirect '/secret'
end

post '/create_account' do
  User.create(params[:user])
end


