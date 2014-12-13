Rails.application.routes.draw do
  get '/welcome' => 'main#welcome'
  post '/welcome/signin' => 'main#signin'
  get '/main/:id' => 'main#game_page'
  get '/game_page_json' => 'main#game_page_json'
  post '/submit_answers' => 'main#submit_answers'
end
