class Story < ActiveRecord::Base
  attr_accessible :body, :image_path, :title
	
	validates :body, presence: true
	validates :title, presence: true
end
