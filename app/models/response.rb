# == Schema Information
#
# Table name: responses
#
#  id           :integer          not null, primary key
#  body         :text
#  challenge_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Response < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :challenge
  attr_accessible :body, :challenge

  validates :body, presence: true, :length => { :maximum => 140 }
  validates :challenge, presence: true
  validates :user, presence: true
end
