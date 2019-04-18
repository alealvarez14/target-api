require 'rails_helper'

describe 'POST api/v1/questions', type: :request do
  let(:user) { create(:user) }
  let(:valid_params) { mock_email }

  subject { post api_v1_questions_path, headers: auth_headers, params: valid_params, as: :json }

  context 'when the params are valid' do
    it 'returns status code 204' do
      subject
      expect(response).to have_http_status(:success)
    end
  end

  context 'when the params are invalid' do
    before do
      valid_params[:subject] = nil
    end

    it 'returns status code 422' do
      subject
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns missing params message' do
      subject
      expect(json['error']).to match(I18n.t('api.errors.missing_param'))
    end
  end
end
