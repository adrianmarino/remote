require 'spec_helper'

class User
	include Persistable
	attr_accessor :username, :password
end

FactoryGirl.define do
	factory :user, class: User do
		username Faker::Name::first_name
		password Faker::Name::last_name
		identifier 1
	end
end

describe ObjectRepository do
	let!(:target) {ObjectRepository.new(:ObjectItem,"description")}

	context "functional actions" do 
		let!(:user) { FactoryGirl.build(:user) }

		before do
			target.save user
		end

		it "should save new object" do 
			(find user).should equal user
		end
		it "should save a modified object" do
			user_modified = newUser
			target.save user_modified
			(find user_modified).should equal user_modified
		end
		it "should remove an object" do
			target.remove user
			(find user).should eql nil
		end
	  	it "should found an object" do
			(find user).should equal user
		end
		it "should find all objects" do
			target.all.first.should equal user
		end
	end
	context "tuple check" do
		it "should have a name on first tuple position" do
		  target.tuple[0].should eql :ObjectItem
		end
		it "should have a class name symbol on second tuple position" do
		  target.tuple[1].should equal :ObjectRepository
		end
		it "should have a self reference on third tuple position" do
		  target.tuple[2].should equal target
		end
		it "should have a descriptionon fourth tuple position" do
		  target.tuple[3].should eql "description"
		end
	end

	private
	def find(an_user)
		target.find(Criteria.idEqlTo(an_user.identifier)).first
	end

	def newUser
		FactoryGirl.build(:user)
	end
end

