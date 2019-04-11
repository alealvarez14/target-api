module Api
  module V1
    class TopicsController < Api::V1::ApiController
      def index
        @topics = Topic.all.includes(:icon_attachment)
      end
    end
  end
end
