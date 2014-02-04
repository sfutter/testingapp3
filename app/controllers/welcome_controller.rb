class WelcomeController < ApplicationController
  #@subreddit = 'funny'

  def index
  	
	result = get_from_reddit('funny')

  # Nice, easy-to-read implementation of parsing the Reddit API
  	@reddit_stories = result['data']['children'].inject(Array.new) do |stories, story|
		stories << { 
			title: story['data']['title'],
			url: story['data']['url'], 
			score: story['data']['score'] 
			}
		stories.sort_by { |hsh| hsh[:score] }.reverse![0..0]
		end
  end


private 
	def get_from_reddit(category)
		endpoint_url = "http://www.reddit.com/r/#{category}.json"
		response = RestClient.get(endpoint_url)
		parsed_response = JSON.parse(response)
	end #this goes in the model 	
  # I agree! "Skinny controllers, fat models" is the mantra!
end


