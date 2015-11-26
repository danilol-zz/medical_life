require "rails_helper"

RSpec.describe MedicalConsultationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/medical_consultations").to route_to("medical_consultations#index")
    end

    it "routes to #new" do
      expect(:get => "/medical_consultations/new").to route_to("medical_consultations#new")
    end

    it "routes to #show" do
      expect(:get => "/medical_consultations/1").to route_to("medical_consultations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/medical_consultations/1/edit").to route_to("medical_consultations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/medical_consultations").to route_to("medical_consultations#create")
    end

    it "routes to #update" do
      expect(:put => "/medical_consultations/1").to route_to("medical_consultations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/medical_consultations/1").to route_to("medical_consultations#destroy", :id => "1")
    end

  end
end
