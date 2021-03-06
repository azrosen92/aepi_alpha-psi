require 'spec_helper'

describe "UserPages" do
	
	subject { page }
	let(:user) { FactoryGirl.create(:user) }

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Create account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by_email('user@example.com') }
		
				it { should have_selector('title', text: user.name) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
				it { should have_link('Sign out') }
			end
		end
	end

	describe "profile page" do

		describe "when signed in" do
			before {valid_signin(user) }
			
			it { should have_selector('title', text: user.name) }
	end

		describe "when not signed in" do

		end
	end
end
