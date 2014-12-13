Rails.application.routes.draw do
  get '/welcome' => 'main#welcome'
  post '/welcome/signin' => 'main#signin'
  get '/main/:id' => 'main#game_page'
end
