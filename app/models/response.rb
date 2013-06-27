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
  belongs_to :challenge
  attr_accessible :body, :challenge
end
