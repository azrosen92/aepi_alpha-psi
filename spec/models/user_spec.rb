# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  year            :string(255)
#  position        :string(255)
#  bio             :string(255)
#  status          :string(255)
#

require 'spec_helper'

describe User do

	before do
		@user = User.new(name: "Example User", email: "example@user.com",
											password: "foobar", password_confirmation: "foobar")
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:remember_token) }
	it { should respond_to(:authenticate) }
	it { should respond_to(:year) }
	it { should respond_to(:position) }
	it { should respond_to(:bio) }
	it { should respond_to(:status) }

	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = " " } 
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
											foo@bar_baz.com foo@bar+baz.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+j@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmaion" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "with password that is too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end

	describe "with invalid position" do
		before { @user.position = "pledgemaster" }
		it { should be_invalid }
	end

	describe "with valid position" do
		POSITIONS = ["master", "lieutenant", "exchecquer", "scribe", "sentinal"]
		POSITIONS.each do |pos|
			before { @user.position = pos }
			it { should be_valid }
		end
	end

	describe "with invalid status" do
		before { @user.status = "kevin" }
		it { should be_invalid }
	end

	describe "with valid status" do
		STATUS = ["brother", "parent"]
		STATUS.each do |stat|
			before { @user.status = stat }
			it { should be_valid }
		end
	end

	describe "return value of authenticate method" do
		before { @user.save }
		let(:found_user) { User.find_by_email(@user.email) }
		
		describe "with valid password" do
			it { should == found_user.authenticate(@user.password) }
		end	
	
		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }

			it { should_not == user_for_invalid_password }
			specify { user_for_invalid_password.should be_false }
		end
	end

	describe "remember token" do
		before { @user.save }
		its(:remember_token) { should_not be_blank }
	end
	
end
