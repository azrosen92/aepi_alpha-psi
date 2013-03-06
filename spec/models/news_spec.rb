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

require 'spec_helper'

describe News do

	before do 
		@story = News.new(title: "alpha psi chapter of alpha espsilon pi at wesleyan 
															rolls out new website",
											story: "The Wesleyan University chapter has recently rolled 
															out a brand new social networking website. The new 
															site will allow the fraternity to increase 
															brotherhood ten-fold, as well as peaking brothership
													 		to an all time high. According to one source, 'AEPi 
															is basically going to revolutionize the way
															fraternities run'.")
	end

	subject { @user }

	it { should respond_to(:title) }
	it { should respond_to(:story) }

	it { should be_valid }

end
