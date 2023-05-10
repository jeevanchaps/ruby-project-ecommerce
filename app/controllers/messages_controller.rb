class MessagesController < ApplicationController
    #Note, this page will require the user to be signed in.SS
    def messages()
        respond_to do |format|
            format.html do
                if(user_signed_in?)
                signed_in_user = User.find_by_name(current_user.name)
                render :messages, locals: {signed_in_user: signed_in_user}
                
                else
                    flash[:error] = "You must be signed in to access messages."
                    redirect_to "/users/sign_in"
                end
             end

        end
    end

    def message_board()
        signed_in_user = User.find_by_name(current_user.name)
        all_messg = signed_in_user.messages
        messages = []
        all_messg.each do |m|
            if( (m.sender == params[:id] && m.recipient == signed_in_user.user_name) || (m.recipient == params[:id] && m.sender == signed_in_user.user_name))
                m.is_new = false;
                m.save!
                messages.push(m)
            end
        end
    
       
        respond_to do |format| 
            message_sender = User.find_by_user_name(params[:id])
            format.html{ render :message_board, locals: {message_sender: message_sender, messages: messages}}
        end
    end

    def send_message()
        message = Message.new(params.require(:message).permit(:content, :sender, :recipient))
        message.is_new = true;
        message.user_id = User.find_by_user_name(params[:id]).id
        message.save!

        message = Message.new(params.require(:message).permit(:content, :sender, :recipient))
        message.is_new = false
        message.user_id = current_user.id
        message.save!

        signed_in_user = User.find_by_name(current_user.name)

        respond_to do |format|
            format.html do
                redirect_back(fallback_location: root_path)
            end
        end
    end
end
