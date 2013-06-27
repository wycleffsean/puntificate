# == Schema Information
#
# Table name: responses
#
#  id                 :integer          not null, primary key
#  body               :text
#  challenge_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  cached_votes_total :integer          default(0)
#  cached_votes_score :integer          default(0)
#  cached_votes_up    :integer          default(0)
#  cached_votes_down  :integer          default(0)
#  user_name          :string(255)
#

class Response < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :challenge
  attr_accessible :body, :challenge

  validates :body, presence: true, :length => { :maximum => 140 }
  validates :challenge, presence: true
  validates :user, presence: true

  before_save :set_user_name

  def set_user_name
  	user_name = user.name
  end
end
