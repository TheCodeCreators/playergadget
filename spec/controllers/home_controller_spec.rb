require 'rails_helper'

describe HomeController, type: :controller do
  before(:each) do
    @user = create(:user)
  end

  describe '#index' do
    context 'is a free for all page' do
      it 'should allow any visitor' do
        process :index, method: :get
        expect(response.status).to eq(200)
      end
    end
  end
end
