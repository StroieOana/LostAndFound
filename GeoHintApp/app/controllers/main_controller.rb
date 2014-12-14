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
      @last_level_id = Level.order(:id => :desc).first.id
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
      failed = 0
      params.keys.select{|k| k.start_with?('answer')}.each do |answer_key|
            answer_id = answer_key.gsub(/^answer/,'').to_i
            if( params[answer_key] != Hint.find_by(:id => answer_id).answer )
                  failed = 1
            end
      end
      if( failed == 0 )
         user = User.find_by(:id => session[:user_id])
         if( user.level_id != Level.last.id )
            user.update(:level_id => user.level_id + 1)
         end
      end
      id = session[:user_id]
      redirect_to ("/main/#{id}")
   end
   
   def ranking
      @user_order=User.order(:level_id => :desc)
      @count = 0
   end
   
   def back
      id = session[:user_id]
      redirect_to ("/main/#{id}")
   end
   
   def addlevel
   end
   
   def insertlevel
      level = Level.create(:name => "level"+(Level.order(:id => :desc).first.id.to_i + 1).to_s)
      Hint.create(:question => params[:hint1], :answer => params[:a1], :level_id => Level.order(:id => :desc).first.id, :lat => params[:lat1], :long =>params[:long1])
      Hint.create( :question => params[:hint2], :answer => params[:a2], :level_id => Level.order(:id => :desc).first.id, :lat => params[:lat2], :long =>params[:long2])
   
      id = session[:user_id]
      redirect_to ("/main/#{id}")
   end

end
