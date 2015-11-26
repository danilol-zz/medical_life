require "rails_helper"

RSpec.describe SpecializationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/specializations").to route_to("specializations#index")
    end

    it "routes to #new" do
      expect(:get => "/specializations/new").to route_to("specializations#new")
    end

    it "routes to #show" do
      expect(:get => "/specializations/1").to route_to("specializations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/specializations/1/edit").to route_to("specializations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/specializations").to route_to("specializations#create")
    end

    it "routes to #update" do
      expect(:put => "/specializations/1").to route_to("specializations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/specializations/1").to route_to("specializations#destroy", :id => "1")
    end

  end
end
