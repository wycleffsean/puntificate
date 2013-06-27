class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :body, :challenge
end
