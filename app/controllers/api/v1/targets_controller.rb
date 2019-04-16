module Api
  module V1
    class TargetsController < Api::V1::ApiController
      helper_method :target

      def index
        @targets = current_user.targets
      end

      def create
        @target = current_user.targets.create! target_params
      end

      def destroy
        target.destroy!
        head :ok
      end

      private

      def target_params
        params.require(:target).permit(:lat, :long, :topic_id, :title, :radius)
      end

      def target
        @target ||= current_user.targets.find(target_id)
      end

      def target_id
        params[:target_id] || params[:id]
      end
    end
  end
end
