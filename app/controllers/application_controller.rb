
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    erb :show
  end

  patch '/articles/:id' do
    Article.find(params["id"]).update(title: params["title"], content: params["content"])
    redirect "/articles/#{params["id"]}"
  end

  delete '/articles/:id' do
    Article.find(params["id"]).destroy
  end

  get '/articles/:id/edit' do
    @article = Article.find(params["id"])
    erb :edit
  end

  post '/articles' do
    art = Article.create(params)
    redirect "/articles/#{art.id}"
  end



end
