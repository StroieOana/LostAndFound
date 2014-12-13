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
      level = Level.find_by(:id => @user.level_id)
      @hints = level.hints
      session[:level_id] = level.id
      session[:user_id] = params[:id]
   end
   
   def game_page_json
      level = Level.find_by(:id => session[:level_id])
      render :json => level.hints
   end
   
   def submit_answers
      @hints = Level.find_by(:id => session[:level_id]).hints
     # failed = 0
      
  #    @hints.each do |hint|
   #      if( hint.answer != params[#{hint.id}] )
      #        failed = 1
    #     end
    #  end
      
     # if( failed == 0 )
           #next level
     # end
      puts "HELOO2"
      puts params[1]
      puts params[2]
      puts "HELOO2"
      id = session[:user_id]
      redirect_to ("/main/#{id}")
   end

end
