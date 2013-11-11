class InterestsController < ApplicationController
	def create
		@wire = Wire.find(params[:wire_id])
		@interest = @wire.interests.create(params[:interest].permit(:topic))
		redirect_to wire_path(@wire)
	end

	def destroy
    @wire = Wire.find(params[:wire_id])
    @interest = @wire.interests.find(params[:id])
    @interest.destroy
    redirect_to wire_path(@wire)
  end

end
