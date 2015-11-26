require 'rails_helper'

RSpec.describe SpecializationsController, :type => :controller do
  before { session[:user_id] = current_user_id }

  let(:user_attributes) { FactoryGirl.attributes_for(:user) }
  let(:current_user_id) { User.create(user_attributes).id }

  let(:valid_attributes) { FactoryGirl.attributes_for(:specialization) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:specialization, description: nil) }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all specializations as @specializations" do
      specialization = Specialization.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:specializations)).to eq([specialization])
    end
  end

  describe "GET new" do
    it "assigns a new specialization as @specialization" do
      get :new, {}, valid_session
      expect(assigns(:specialization)).to be_a_new(Specialization)
    end
  end

  describe "GET edit" do
    it "assigns the requested specialization as @specialization" do
      specialization = Specialization.create! valid_attributes
      get :edit, {:id => specialization.to_param}, valid_session
      expect(assigns(:specialization)).to eq(specialization)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Specialization" do
        expect {
          post :create, {:specialization => valid_attributes}, valid_session
        }.to change(Specialization, :count).by(1)
      end

      it "assigns a newly created specialization as @specialization" do
        post :create, {:specialization => valid_attributes}, valid_session
        expect(assigns(:specialization)).to be_a(Specialization)
        expect(assigns(:specialization)).to be_persisted
      end

      it "redirects to the created specialization" do
        post :create, {:specialization => valid_attributes}, valid_session
        expect(response).to redirect_to(Specialization.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved specialization as @specialization" do
        post :create, {:specialization => invalid_attributes}, valid_session
        expect(assigns(:specialization)).to be_a_new(Specialization)
      end

      it "re-renders the 'new' template" do
        post :create, {:specialization => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:specialization, description: "updated description") }

      it "updates the requested specialization" do
        specialization = Specialization.create! valid_attributes
        put :update, {:id => specialization.to_param, :specialization => new_attributes}, valid_session
        specialization.reload
        expect(specialization.description).to eq "updated description"
      end

      it "assigns the requested specialization as @specialization" do
        specialization = Specialization.create! valid_attributes
        put :update, {:id => specialization.to_param, :specialization => valid_attributes}, valid_session
        expect(assigns(:specialization)).to eq(specialization)
      end

      it "redirects to the specialization" do
        specialization = Specialization.create! valid_attributes
        put :update, {:id => specialization.to_param, :specialization => valid_attributes}, valid_session
        expect(response).to redirect_to(specialization)
      end
    end

    describe "with invalid params" do
      it "assigns the specialization as @specialization" do
        specialization = Specialization.create! valid_attributes
        put :update, {:id => specialization.to_param, :specialization => invalid_attributes}, valid_session
        expect(assigns(:specialization)).to eq(specialization)
      end

      it "re-renders the 'edit' template" do
        specialization = Specialization.create! valid_attributes
        put :update, {:id => specialization.to_param, :specialization => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested specialization" do
      specialization = Specialization.create! valid_attributes
      expect {
        delete :destroy, {:id => specialization.to_param}, valid_session
      }.to change(Specialization, :count).by(-1)
    end

    it "redirects to the specializations list" do
      specialization = Specialization.create! valid_attributes
      delete :destroy, {:id => specialization.to_param}, valid_session
      expect(response).to redirect_to(specializations_url)
    end
  end
end
