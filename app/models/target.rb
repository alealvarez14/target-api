# == Schema Information
#
# Table name: targets
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  lat        :float            not null
#  long       :float            not null
#  radius     :float            not null
#  topic_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#

class Target < ApplicationRecord
  MAX_TARGETS = 10

  belongs_to :topic
  belongs_to :user

  validates :title, :radius, :lat, :long, presence: true
  validate :limit_targets, on: :create

  def limit_targets
    return unless user.targets.count >= 10

    errors.add(:target, I18n.t('api.targets.errors.max_targets', max_targets: MAX_TARGETS))
  end
end
