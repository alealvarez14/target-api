require 'rails_helper'

describe 'GET api/v1/targets/', type: :request do
  let(:user) { create(:user) }
  let(:api_v1_target_path) { '/api/v1/targets' }

  subject { get api_v1_target_path, headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  context 'a user has targets' do
    let!(:targets) { create_list(:target, 3, user: user) }

    it 'returns only my targets' do
      subject
      expect(json[:targets].length).to eq(3)
    end
  end

  context 'a user has no targets' do
    let!(:targets) { create_list(:target, 3) }

    it 'doesn\'t return other user\'s targets' do
      subject
      expect(json[:targets].length).to eq(0)
    end
  end
end
