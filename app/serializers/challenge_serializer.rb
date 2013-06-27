class ChallengeSerializer < ActiveModel::Serializer
  attributes :id, :body, :url, :response_ids
end
