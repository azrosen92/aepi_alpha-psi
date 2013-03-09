class StoriesController < ApplicationController

	def index
		@stories = Story.all
	end

	def new
		@story = Story.new
	end

	def create
		if @story.save
			
		else

		end
	end
end
