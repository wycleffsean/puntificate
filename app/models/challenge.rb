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
  has_many :responses
  attr_accessible :body, :url, :responses

  def response_ids
  	responses.select(:id).map(&:id)
  end
=begin
  def as_json(options={})
  	super(options.merge(:methods => [:response_ids]))
  end
=end
end
