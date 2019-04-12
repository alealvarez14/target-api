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

class Topic < ApplicationRecord
  has_one_attached :icon
  has_many :targets

  validates :title, presence: true
end
