class StoriesController < ApplicationController

	def index
		@stories = Story.all.reverse
    @story = Story.new
	end

	def create
    @story = Story.new(params[:story])
		if @story.save
			flash[:success] = "Story saved!"
      redirect_to stories_path
		else

		end
	end
end
