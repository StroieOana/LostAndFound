class MainController < ActionController::Base
   
   def welcome
      
   end

   def signin
      user_name = params[:username]
      user_pass = params[:password]
      user = User.find_by({:name => user_name})
      if( user.nil? )
         redirect_to '/welcome'
         return
      end
      if( user.password == user_pass )
         puts "blablabla"
         redirect_to ("/main/#{user.id}")
         return
      else
         redirect_to '/welcome'
         return
      end
   end
   
   def game_page
      @user_all = User.all
      @user = User.find_by(:id => params[:id])
      
   end

end
