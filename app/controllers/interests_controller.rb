class InterestsController < ApplicationController
	def create
		@user = current_user
		@wire = Wire.find(params[:wire_id])
		@interest = @wire.interests.create(params[:interest].permit(:topic))
		
		if @interest.save
			#UserMailer.welcome_email(@user).deliver
			
			# for now don't send the email  ** UNCOMMENT AFTERWARDs ###
			UserMailer.interest_email(@user).deliver
		end
  	
		redirect_to wire_path(@wire)

	end

	def destroy
    @wire = Wire.find(params[:wire_id])
    @interest = @wire.interests.find(params[:id])
    @interest.destroy
    redirect_to wire_path(@wire)
  end

  

end


