class BaseSerializer
  include JSONAPI::Serializer

  def self_link
    "/api/v1/#{type}/#{id}"
  end
end
