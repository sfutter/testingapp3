class UserMailer < ActionMailer::Base

  default from: "codingpractice2@gmail.com"

  def welcome_email(user)
    @user = user
    #email_with_name = "#{@user.name} <#{@user.email}>"
    #@url  = 'http://example.com/login'
    mail(to: 'futter.steven@gmail.com', subject: 'Welcome to My Awesome Site') do |format|
    format.html { render 'welcome_email' }
	end
  end


  def interest_email(user)
  	#@user = user
  	@user = user
  	@url = "go fuck yourselves"
  	mail(to: 'futter.steven@gmail.com', subject: "Stories matching #{@interest}") do |format|
  	format.html { render 'interest_email'}
  	end
  end



  def index
	result = get_from_reddit('funny')
  	@reddit_stories = result['data']['children'].inject(Array.new) do |stories, story|
		stories << { 
			title: story['data']['title'],
			url: story['data']['url'], 
			score: story['data']['score'] 
			}
	@body[:reddit_stories] #reddit_stories.sort_by { |hash| hash[:score].to_i }.reverse![0..3]

		end
  end


private 
	def get_from_reddit(category)
		endpoint_url = "http://www.reddit.com/r/#{category}.json"
		response = RestClient.get(endpoint_url)
		parsed_response = JSON.parse(response)
	end #this goes in the model 


end
