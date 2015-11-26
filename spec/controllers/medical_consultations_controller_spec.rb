require 'rails_helper'
RSpec.describe MedicalConsultationsController, :type => :controller do
  before { session[:user_id] = current_user_id }

  let(:user_attributes) { FactoryGirl.attributes_for(:user) }
  let(:current_user_id) { User.create(user_attributes).id }

  let(:valid_attributes) { FactoryGirl.attributes_for(:medical_consultation) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:medical_consultation, doctor_id: nil, date: nil, specialization_id: nil, prescription: nil) }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all medical_consultations as @medical_consultations" do
      medical_consultation = MedicalConsultation.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:medical_consultations)).to eq([medical_consultation])
    end
  end

  describe "GET new" do
    it "assigns a new medical_consultation as @medical_consultation" do
      doctor1 = FactoryGirl.create(:doctor, name: 'x doctor', crm_number: '123', email: 'docx@doc.com')
      doctor2 = FactoryGirl.create(:doctor, name: 'a doctor', crm_number: '234', email: 'doca@doc.com')
      get :new, {}, valid_session
      expect(assigns(:medical_consultation)).to be_a_new(MedicalConsultation)
      expect(assigns(:doctors)).to eq([doctor2, doctor1])
    end
  end

  describe "GET edit" do
    it "assigns the requested medical_consultation as @medical_consultation" do
      medical_consultation = MedicalConsultation.create! valid_attributes
      get :edit, {:id => medical_consultation.to_param}, valid_session
      expect(assigns(:medical_consultation)).to eq(medical_consultation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new MedicalConsultation" do
        expect {
          post :create, {:medical_consultation => valid_attributes}, valid_session
        }.to change(MedicalConsultation, :count).by(1)
      end

      it "assigns a newly created medical_consultation as @medical_consultation" do
        post :create, {:medical_consultation => valid_attributes}, valid_session
        expect(assigns(:medical_consultation)).to be_a(MedicalConsultation)
        expect(assigns(:medical_consultation)).to be_persisted
      end

      it "redirects to the created medical_consultation" do
        post :create, {:medical_consultation => valid_attributes}, valid_session
        expect(response).to redirect_to(medical_consultations_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved medical_consultation as @medical_consultation" do
        post :create, {:medical_consultation => invalid_attributes}, valid_session
        expect(assigns(:medical_consultation)).to be_a_new(MedicalConsultation)
      end

      it "re-renders the 'new' template" do
        post :create, {:medical_consultation => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:medical_consultation, doctor_id: 3, specialization_id: 2, prescription: "updated prescription") }

      it "updates the requested medical_consultation" do
        medical_consultation = MedicalConsultation.create! valid_attributes
        put :update, {:id => medical_consultation.to_param, :medical_consultation => new_attributes}, valid_session
        medical_consultation.reload
        expect(medical_consultation.doctor_id).to eq 3
        expect(medical_consultation.specialization_id).to eq 2
        expect(medical_consultation.prescription).to eq "updated prescription"
      end

      it "assigns the requested medical_consultation as @medical_consultation" do
        medical_consultation = MedicalConsultation.create! valid_attributes
        put :update, {:id => medical_consultation.to_param, :medical_consultation => valid_attributes}, valid_session
        expect(assigns(:medical_consultation)).to eq(medical_consultation)
      end

      it "redirects to the medical_consultation" do
        medical_consultation = MedicalConsultation.create! valid_attributes
        put :update, {:id => medical_consultation.to_param, :medical_consultation => valid_attributes}, valid_session
        expect(response).to redirect_to(medical_consultation)
      end
    end

    describe "with invalid params" do
      it "assigns the medical_consultation as @medical_consultation" do
        medical_consultation = MedicalConsultation.create! valid_attributes
        put :update, {:id => medical_consultation.to_param, :medical_consultation => invalid_attributes}, valid_session
        expect(assigns(:medical_consultation)).to eq(medical_consultation)
      end

      it "re-renders the 'edit' template" do
        medical_consultation = MedicalConsultation.create! valid_attributes
        put :update, {:id => medical_consultation.to_param, :medical_consultation => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested medical_consultation" do
      medical_consultation = MedicalConsultation.create! valid_attributes
      expect {
        delete :destroy, {:id => medical_consultation.to_param}, valid_session
      }.to change(MedicalConsultation, :count).by(-1)
    end

    it "redirects to the medical_consultations list" do
      medical_consultation = MedicalConsultation.create! valid_attributes
      delete :destroy, {:id => medical_consultation.to_param}, valid_session
      expect(response).to redirect_to(medical_consultations_url)
    end
  end

end
