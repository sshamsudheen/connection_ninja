require 'spec/spec_helper'
require 'connection_ninja'
include ConnectionNinja

describe Order do
  it "should be connected to the default database" do
    Order.connection.current_database.should == "connection_ninja"
  end
  
  it "should have RAILS_ENV development" do
    RAILS_ENV.should == "development"
  end
end

describe Customer do
  it "should be connected to the default database" do
    Customer.connection.current_database.should == "connection_ninja"
  end
  
  it "should respond to use_connection_ninja" do
    Customer.respond_to?(:use_connection_ninja).should == true
  end
  
  it "should respond to load_config" do
    Customer.respond_to?(:load_config).should be_true
  end
  
  it "should have RAILS_ENV development" do
    RAILS_ENV.should == "development"
  end
end

describe Customer,"load_config" do
  before do
    Customer.load_config("#{PROJECT_ROOT}/lib/config.yml", :alternate)
  end
  
  it "should find the config file" do
    Customer.connection_ninja_config.should_not be_nil
  end
  
  it "should call YAML load file" do
    Customer.load_config("#{PROJECT_ROOT}/lib/config.yml", :alternate).should_not be_nil
  end
end

describe Customer,"use_connection_ninja" do
  
end