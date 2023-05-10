module DeviseHelper
    def devise_error_messages!
            messages = ""
            #flash[:error] = nil
            flash.each do |name, msg| 
                messages =  msg
            end
            if(messages != nil && messages != "")
                flash.now[:error] = messages
            end

      
    end

end