class WelcomeController < ApplicationController
  #@subreddit = 'funny'

  def index
	result = get_from_reddit('funny')
  	@reddit_stories = result['data']['children'].inject(Array.new) do |stories, story|
		stories << { 
			title: story['data']['title'],
			url: story['data']['url'], 
			score: story['data']['score'] 
			}
	#reddit_stories.sort_by { |hash| hash[:score].to_i }.reverse![0..3]

		end
  end


private 
	def get_from_reddit(category)
		endpoint_url = "http://www.reddit.com/r/#{category}.json"
		response = RestClient.get(endpoint_url)
		parsed_response = JSON.parse(response)
	end #this goes in the model 	
end


