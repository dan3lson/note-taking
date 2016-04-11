class AuthController < ApplicationController
	def gettoken
		token = get_token_from_code params[:code]
		session[:azure_access_token] = token.token
	  session[:user_email] = get_email_from_id_token(token.params['id_token'])
		session[:username] = session[:user_email].split("@")[0]
		
	  redirect_to meetings_path
	end
end
