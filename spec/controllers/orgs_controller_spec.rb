require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OrgsController, type: :controller do
  before { current_user }

  # This should return the minimal set of attributes required to create a valid
  # Org. As you add validations to Org, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrgsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all orgs as @orgs' do
      org = Org.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:orgs)).to eq([org])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested org as @org' do
      org = Org.create! valid_attributes
      get :show, { id: org.to_param }, valid_session
      expect(assigns(:org)).to eq(org)
    end
  end

  describe 'GET #new' do
    it 'assigns a new org as @org' do
      get :new, {}, valid_session
      expect(assigns(:org)).to be_a_new(Org)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested org as @org' do
      org = Org.create! valid_attributes
      get :edit, { id: org.to_param }, valid_session
      expect(assigns(:org)).to eq(org)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Org' do
        expect do
          post :create, { org: valid_attributes }, valid_session
        end.to change(Org, :count).by(1)
      end

      it 'assigns a newly created org as @org' do
        post :create, { org: valid_attributes }, valid_session
        expect(assigns(:org)).to be_a(Org)
        expect(assigns(:org)).to be_persisted
      end

      it 'redirects to the created org' do
        post :create, { org: valid_attributes }, valid_session
        expect(response).to redirect_to(Org.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved org as @org' do
        post :create, { org: invalid_attributes }, valid_session
        expect(assigns(:org)).to be_a_new(Org)
      end

      it "re-renders the 'new' template" do
        post :create, { org: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested org' do
        org = Org.create! valid_attributes
        put :update, { id: org.to_param, org: new_attributes }, valid_session
        org.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested org as @org' do
        org = Org.create! valid_attributes
        put :update, { id: org.to_param, org: valid_attributes }, valid_session
        expect(assigns(:org)).to eq(org)
      end

      it 'redirects to the org' do
        org = Org.create! valid_attributes
        put :update, { id: org.to_param, org: valid_attributes }, valid_session
        expect(response).to redirect_to(org)
      end
    end

    context 'with invalid params' do
      it 'assigns the org as @org' do
        org = Org.create! valid_attributes
        put :update, { id: org.to_param, org: invalid_attributes }, valid_session
        expect(assigns(:org)).to eq(org)
      end

      it "re-renders the 'edit' template" do
        org = Org.create! valid_attributes
        put :update, { id: org.to_param, org: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested org' do
      org = Org.create! valid_attributes
      expect do
        delete :destroy, { id: org.to_param }, valid_session
      end.to change(Org, :count).by(-1)
    end

    it 'redirects to the orgs list' do
      org = Org.create! valid_attributes
      delete :destroy, { id: org.to_param }, valid_session
      expect(response).to redirect_to(orgs_url)
    end
  end
end
