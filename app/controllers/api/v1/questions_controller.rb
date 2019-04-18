module Api
  module V1
    class QuestionsController < Api::V1::ApiController
      before_action :check_params

      def create
        ApplicationMailer.email_admin(current_user.email, params[:subject], params[:body]).deliver_now
      end

      private

      def check_params
        render_parameter_missing('subject or body') unless params[:subject].present? && params[:body].present?
      end
    end
  end
end
