class UserMailer < ActionMailer::Base

  default from: "codingpractice2@gmail.com"

  def welcome_email(user)
    @user = user
    #email_with_name = "#{@user.name} <#{@user.email}>"
    #@url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
    format.html { render 'welcome_email' }
	end
  end


  def interest_email(user)
  	@user = user
    @interest = @user.wires.first.interests.last
    #@wire = Wire.find(params[:wire_id])
    #@interest = @wire.interests.create(params[:interest].permit(:topic))
    #category = 'funny'
    result = get_from_reddit(@interest.topic)
    @reddit_stories = result['data']['children'].inject(Array.new) do |stories, story|
    stories << { 
      title: story['data']['title'],
      url: story['data']['url'], 
      score: story['data']['score'] 
      }
    stories.sort_by { |hsh| hsh[:score] }.reverse![0..2]
    end


  	@url = "http://twominutebreak.me"
  	mail(to: @user[:email], subject: "Stories matching #{@interest}") do |format|
  	format.html { render 'interest_email'}
  	end

  end



private 
	def get_from_reddit(category)
		endpoint_url = "http://www.reddit.com/r/#{category}.json"
		response = RestClient.get(endpoint_url)
		parsed_response = JSON.parse(response)
	end #this goes in the model 


end
