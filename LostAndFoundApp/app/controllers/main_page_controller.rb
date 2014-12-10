class MainPageController < ActionController::Base

   def main
   end

   def addnewitem
        

   end		
   
   def additem
       puts params[:description]
       	

       redirect_to '/main'
   end

end
