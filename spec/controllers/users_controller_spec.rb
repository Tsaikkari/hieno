require 'rails_helper'

describe UsersController, type: :controller do

  let(:user1) { User.create!(password: "987654321", email: "perttu@gmx.de") }
  let(:user2) { User.create!(password: '1234567890', email: 'susan@example.com')}

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user1
        sign_in user2
      end
      it "loads correct user details" do
        get :show, params: { id: user1.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user tries to access other user details' do
      it "cannot access the other user's details" do
        get :show, params: { id: user2.id}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user2.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
