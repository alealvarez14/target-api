# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :topic do
    title { Faker::Name.unique.name }

    trait :with_icon do
      icon { FilesTestHelper.png }
    end
  end
end
