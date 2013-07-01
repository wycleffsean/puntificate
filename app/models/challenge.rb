# == Schema Information
#
# Table name: challenges
#
#  id                 :integer          not null, primary key
#  body               :text
#  url                :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  cached_votes_total :integer          default(0)
#  cached_votes_score :integer          default(0)
#  cached_votes_up    :integer          default(0)
#  cached_votes_down  :integer          default(0)
#  user_name          :string(255)
#  closed             :boolean          default(FALSE)
#  closed_at          :datetime
#

class Challenge < ActiveRecord::Base
  default_scope where('closed = false')
  acts_as_votable
  belongs_to :user
  has_many :responses
  attr_accessible :body, :url, :responses

  validates :body, presence: true, :length => { maximum: 500 }
  validates :user, presence: true

  before_save :set_user_name
  def set_user_name
  	self.user_name = user.name
  end

  before_create :closing_time
  def closing_time
    self.closed_at = DateTime.now + 24.hours    
  end

  after_create :expire_challenge
  def expire_challenge
    self.delay_until(self.closed_at).close
  end

  def close
    self.closed = true
    self.save
  end

  def response_ids
  	responses.select(:id).map(&:id)
  end
end
