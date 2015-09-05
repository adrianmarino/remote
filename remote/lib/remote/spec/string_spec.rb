require 'spec_helper.rb'

describe String do
	it "should capitalize first character of string" do
		'first'.capitalize_first_character.should eql 'First'
	end
	it "should remove first character" do
		'first'.remove_first.should eql 'irst'
	end
	it "should transform string to instance variable name format" do
	  	'instance_variable'.to_instance_variable_name.should eql '@instance_variable'
	end
	it "should eql to at string" do
	  String::empty.should eql ""
	end
	it "should eql to white space" do
	  String::white_space.should eql ' '
	end
	it "should eql to equal character" do
	  String::equal.should eql '='
	end
	it "should eql to new line character" do
	  String::new_line.should eql "\n"
	end
	it "should eql to quote character" do
	  String::quote.should eql "\""
	end
	it "should get sub string after last occur of pattern" do
	  'a/path/concrete'.sub_after_last('/').should eql 'concrete'
	end
	it "should get sub string before last occur of pattern" do
	  'a/path/concrete'.sub_before_last('/').should eql 'a/path'
	end
end
