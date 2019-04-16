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

FactoryBot.define do
  factory :target do
    title   { Faker::Name.unique.name }
    lat     { Faker::Address.latitude }
    long    { Faker::Address.longitude }
    radius  { Faker::Number.number(5) }
    topic
    user
  end
end
