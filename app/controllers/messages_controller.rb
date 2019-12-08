class MessagesController < ApplicationController

	def new
		@message = Message.new
	end

	def create
		if current_user.nil?
			@message = Message.new(message_params)
		else
			@message = current_user.messages.build(message_params)
		end
		
		if @message.save
			flash[:success] = "Message Sent!"
			redirect_to store_url
		else
			flash[:danger] = "(subject, email and message must be present) Unsuccessful send, missing information :( "
			redirect_to :back
		end
	end


	private

 	 def message_params
		params.require(:message).permit(:sender_email, :subject, :content)
 	 end


end
