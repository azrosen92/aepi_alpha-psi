require 'spec_helper'

describe "StaticPages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title', text: page_title) }
	end
	
	describe "Launch Page" do
		before { visit root_path }
		let(:heading) { 'AEPi | Alpha Psi' }
		let(:page_title) { 'AEPi | Alpha Psi' }

		it_should_behave_like "all static pages"
	end

	describe "about page" do
		before { visit about_path }
		let(:heading) { 'About Us' }
		let(:page_title) { 'AEPi | About Us' }

		it_should_behave_like "all static pages"
	end

end
