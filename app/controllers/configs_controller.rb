class ConfigsController < ApplicationController

	before_action :correct_user_config, only: [:show]

	def new
		@config = Config.new
	end

	def create
		@config = current_user.configs.build(config_params)
		  if @config.save
			redirect_to config_path(@config)
		  else
		  	render 'new'
	  	end
	end

	def show
		@config = Config.find(params[:id])
	end

	def index
		@search = current_user.configs.search(params[:q])
    	@configs = @search.result.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
	end

private

 	 def config_params
		params.require(:config).permit(:project, :rack_q, :comment)
 	 end

	# Confirms the correct user.
	def correct_user_config
		@user = current_user.id
		@config = Config.find(params[:id])
		redirect_to(root_url) unless @user == @config.user_id
	end


end
