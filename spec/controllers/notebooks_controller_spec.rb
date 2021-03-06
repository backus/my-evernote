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

RSpec.describe NotebooksController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Notebook. As you add validations to Notebook, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: Faker::Lorem.sentence, guid: Faker::Lorem.characters(20) }
  end

  let(:invalid_attributes) do
    { guid: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NotebooksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all notebooks as @notebooks' do
      notebook = Notebook.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:notebooks)).to eq([notebook])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested notebook as @notebook' do
      notebook = Notebook.create! valid_attributes
      get :show, { id: notebook.to_param }, valid_session
      expect(assigns(:notebook)).to eq(notebook)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested notebook as @notebook' do
      notebook = Notebook.create! valid_attributes
      get :edit, { id: notebook.to_param }, valid_session
      expect(assigns(:notebook)).to eq(notebook)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { title: Faker::Lorem.sentence, guid: Faker::Lorem.characters(20) }
      end

      it 'updates the requested notebook' do
        notebook = Notebook.create! valid_attributes
        put :update, { id: notebook.to_param, notebook: new_attributes }, valid_session
        notebook.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested notebook as @notebook' do
        notebook = Notebook.create! valid_attributes
        put :update, { id: notebook.to_param, notebook: valid_attributes }, valid_session
        expect(assigns(:notebook)).to eq(notebook)
      end

      it 'redirects to the notebook' do
        notebook = Notebook.create! valid_attributes
        put :update, { id: notebook.to_param, notebook: valid_attributes }, valid_session
        expect(response).to redirect_to(notebook)
      end
    end

    context 'with invalid params' do
      it 'assigns the notebook as @notebook' do
        notebook = Notebook.create! valid_attributes
        put :update, { id: notebook.to_param, notebook: invalid_attributes }, valid_session
        expect(assigns(:notebook)).to eq(notebook)
      end

      it "re-renders the 'edit' template" do
        notebook = Notebook.create! valid_attributes
        put :update, { id: notebook.to_param, notebook: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end
end
