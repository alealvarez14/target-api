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

require 'rails_helper'

describe Target do
  subject { build(:target) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:topic) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_presence_of(:long) }
    it { is_expected.to validate_presence_of(:radius) }
  end

  context 'when trying to create targets' do
    let(:user)  { create(:user) }
    let(:topic) { create(:topic) }
    let!(:targets) { create_list(:target, 10, user: user, topic: topic) }

    subject { build(:target, user: user, topic: topic) }

    it 'can create up to 10 targets' do
      expect(user.targets.count).to eq(10)
    end

    it 'is invalid to create more than 10 targets' do
      expect { subject }.not_to change(user.targets, :count)
    end
  end
end
