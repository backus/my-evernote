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

RSpec.describe NotesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Note. As you add validations to Note, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { title: Faker::Lorem.sentence, guid: Faker::Lorem.characters(20) }
  end

  let(:invalid_attributes) do
    { guid: nil }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # NotesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all notes as @notes' do
      note = Note.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:notes)).to eq([note])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested note as @note' do
      note = Note.create! valid_attributes
      get :show, { id: note.to_param }, valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested note as @note' do
      note = Note.create! valid_attributes
      get :edit, { id: note.to_param }, valid_session
      expect(assigns(:note)).to eq(note)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { title: Faker::Lorem.sentence }
      end

      it 'updates the requested note' do
        note = Note.create! valid_attributes
        put :update, { id: note.to_param, note: new_attributes }, valid_session
        note.reload
        expect(note.title).to eq new_attributes[:title]
      end

      it 'assigns the requested note as @note' do
        note = Note.create! valid_attributes
        put :update, { id: note.to_param, note: valid_attributes }, valid_session
        expect(assigns(:note)).to eq(note)
      end

      it 'redirects to the note' do
        note = Note.create! valid_attributes
        put :update, { id: note.to_param, note: valid_attributes }, valid_session
        expect(response).to redirect_to(note)
      end
    end

    context 'with invalid params' do
      it 'assigns the note as @note' do
        note = Note.create! valid_attributes
        put :update, { id: note.to_param, note: invalid_attributes }, valid_session
        expect(assigns(:note)).to eq(note)
      end

      it "re-renders the 'edit' template" do
        note = Note.create! valid_attributes
        put :update, { id: note.to_param, note: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end
end
