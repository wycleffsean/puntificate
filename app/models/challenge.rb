# == Schema Information
#
# Table name: challenges
#
#  id         :integer          not null, primary key
#  body       :text
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Challenge < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :responses
  attr_accessible :body, :url, :responses

  validates :body, presence: true, :length => { maximum: 500 }
  validates :user, presence: true

  before_save :set_user_name

  def set_user_name
  	user_name = user.name
  end

  def response_ids
  	responses.select(:id).map(&:id)
  end
end
