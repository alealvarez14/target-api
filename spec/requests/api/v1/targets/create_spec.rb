require 'rails_helper'

describe 'POST api/v1/targets/', type: :request do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:radius) { 200 }
  let(:lat) { -34.907103 }
  let(:long) { -56.201237 }

  let(:params) do
    {
      target: {
        title: 'Target test',
        topic_id: topic.id,
        lat: lat,
        long: long,
        radius: radius
      }
    }
  end

  subject { post api_v1_targets_path, headers: auth_headers, params: params, as: :json }

  context 'when the request is valid' do
    it 'returns success' do
      subject
      expect(response).to have_http_status(:success)
    end

    it 'creates the target' do
      expect { subject }.to change(user.targets, :count).by(1)
    end

    it 'associates the correct user' do
      subject
      expect(user.targets.last.user_id).to eq(user.id)
    end

    it 'associates the correct topic' do
      subject
      expect(user.targets.last.topic_id).to eq(topic.id)
    end
  end

  context 'when the request is invalid' do
    before do
      params[:target][:topic_id] = nil
    end

    it 'returns status code 400' do
      subject
      expect(response).to have_http_status(:bad_request)
    end
  end
end
