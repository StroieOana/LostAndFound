Rails.application.routes.draw do
 get '/main' => 'main_page#main'
 get '/addnewitem' => 'main_page#addnewitem'
 post '/additem' => 'main_page#additem'
end
