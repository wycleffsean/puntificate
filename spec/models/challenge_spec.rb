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
#

require 'spec_helper'

describe Challenge do
  pending "add some examples to (or delete) #{__FILE__}"
end
