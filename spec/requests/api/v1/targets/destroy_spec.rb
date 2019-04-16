require 'rails_helper'

describe 'DELETE api/v1/targets/:id', type: :request do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let!(:targets) { create_list(:target, 3, user: user, topic: topic) }
  let!(:target) { targets.first }
  let(:api_v1_target_path) do
    ->(id) { "/api/v1/targets/#{id}" }
  end

  subject { delete api_v1_target_path[target.id], headers: auth_headers, as: :json }

  context 'when the request is valid' do
    it 'returns a successful response' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'deletes the target' do
      expect { subject }.to change(user.targets, :count).by(-1)
    end
  end

  context 'when the request is invalid' do
    let!(:target) { create(:target) }

    it 'returns status code 404' do
      subject
      expect(response).to have_http_status(:not_found)
    end
  end
end
