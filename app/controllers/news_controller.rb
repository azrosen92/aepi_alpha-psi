class NewsController < ApplicationController

	def index
		@stories = News.all
	end

	def create
		@news = News.new(params[:news])
		if @news.save
			redirect_to root_url
		else
			render 'index'
		end
	end

	def new
		@news = News.new
	end
end
