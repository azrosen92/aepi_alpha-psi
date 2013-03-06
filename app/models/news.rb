# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  story      :string(255)
#  image_path :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ActiveRecord::Base
  attr_accessible :image_path, :story, :title

	validates :story, presence: true
	validates :title, presence: true
end
