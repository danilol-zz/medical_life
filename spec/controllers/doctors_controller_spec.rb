require 'rails_helper'
RSpec.describe DoctorsController, :type => :controller do
  before { session[:user_id] = current_user_id }

  let(:user_attributes) { FactoryGirl.attributes_for(:user) }
  let(:current_user_id) { User.create(user_attributes).id }

  let(:valid_attributes) { FactoryGirl.attributes_for(:doctor) }

  let(:invalid_attributes) { FactoryGirl.attributes_for(:doctor, name: nil, email: nil, crm_number: nil) }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all doctors as @doctors" do
      doctor = Doctor.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:doctors)).to eq([doctor])
    end
  end

  describe "GET show" do
    it "assigns the requested doctor as @doctor" do
      doctor = Doctor.create! valid_attributes
      get :show, {:id => doctor.to_param}, valid_session
      expect(assigns(:doctor)).to eq(doctor)
    end
  end

  describe "GET new" do
    it "assigns a new doctor as @doctor" do
      get :new, {}, valid_session
      expect(assigns(:doctor)).to be_a_new(Doctor)
    end
  end

  describe "GET edit" do
    it "assigns the requested doctor as @doctor" do
      doctor = Doctor.create! valid_attributes
      get :edit, {:id => doctor.to_param}, valid_session
      expect(assigns(:doctor)).to eq(doctor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Doctor" do
        expect {
          post :create, {:doctor => valid_attributes}, valid_session
        }.to change(Doctor, :count).by(1)
      end

      it "assigns a newly created doctor as @doctor" do
        post :create, {:doctor => valid_attributes}, valid_session
        expect(assigns(:doctor)).to be_a(Doctor)
        expect(assigns(:doctor)).to be_persisted
      end

      it "redirects to the created doctor" do
        post :create, {:doctor => valid_attributes}, valid_session
        expect(response).to redirect_to(Doctor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved doctor as @doctor" do
        post :create, {:doctor => invalid_attributes}, valid_session
        expect(assigns(:doctor)).to be_a_new(Doctor)
      end

      it "re-renders the 'new' template" do
        post :create, {:doctor => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:doctor, name: "Doctor updated", email: "doctor@doctor.com.br") }

      it "updates the requested doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => new_attributes}, valid_session
        doctor.reload
        expect(doctor.name).to eq "Doctor updated"
        expect(doctor.email).to eq "doctor@doctor.com.br"
      end

      it "assigns the requested doctor as @doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => valid_attributes}, valid_session
        expect(assigns(:doctor)).to eq(doctor)
      end

      it "redirects to the doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => valid_attributes}, valid_session
        expect(response).to redirect_to(doctor)
      end
    end

    describe "with invalid params" do
      it "assigns the doctor as @doctor" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => invalid_attributes}, valid_session
        expect(assigns(:doctor)).to eq(doctor)
      end

      it "re-renders the 'edit' template" do
        doctor = Doctor.create! valid_attributes
        put :update, {:id => doctor.to_param, :doctor => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested doctor" do
      doctor = Doctor.create! valid_attributes
      expect {
        delete :destroy, {:id => doctor.to_param}, valid_session
      }.to change(Doctor, :count).by(-1)
    end

    it "redirects to the doctors list" do
      doctor = Doctor.create! valid_attributes
      delete :destroy, {:id => doctor.to_param}, valid_session
      expect(response).to redirect_to(doctors_url)
    end
  end

end
