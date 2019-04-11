require 'rails_helper'

describe 'GET api/v1/topics/', type: :request do
  let(:user) { create(:user) }
  let(:api_v1_topic_path) { '/api/v1/topics' }

  context 'only one topic exists' do
    let!(:topic) { create(:topic, :with_icon) }

    it 'returns success' do
      get api_v1_topic_path, headers: auth_headers, as: :json

      expect(response).to have_http_status(:success)
    end
    
    it 'returns successfully one topic' do
      get api_v1_topic_path, headers: auth_headers, as: :json
      
      expect(json[:topics][0][:title]).to eq topic.title
      expect(json[:topics][0][:icon_url]).not_to be_nil
    end
  end
    
  context 'has several topics' do
    let!(:topics) { create_list(:topic, 3) }

    it 'returns 3 topics' do  
      get api_v1_topic_path, headers: auth_headers, as: :json

      expect(json[:topics].length).to eq(3)
    end
  end
end
