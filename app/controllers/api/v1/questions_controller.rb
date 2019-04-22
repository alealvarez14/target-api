module Api
  module V1
    class QuestionsController < Api::V1::ApiController
      before_action :check_params

      def create
        AdminQuestionsMailer.admin_questions(current_user.email, params[:subject], params[:body])
                            .deliver_later
      end

      private

      def check_params
        render_parameter_missing('subject or body') unless params_present?
      end

      def params_present?
        params[:subject].present? && params[:body].present?
      end
    end
  end
end
