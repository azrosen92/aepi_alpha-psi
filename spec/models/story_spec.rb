require 'spec_helper'

describe Story do

	before { @story = Story.new(title: "news story", body: "news body") }

	subject { @story }

	it { should respond_to(:title) }
	it { should respond_to(:body) }
	it { should respond_to(:image_path) }

	it { should be_valid }

	describe "with no body" do
		before { @story.body = " " }
		it { should be_invalid }
	end

	describe "with no title" do
		before { @story.title =  " " }
		it { should be_invalid }
	end
end
