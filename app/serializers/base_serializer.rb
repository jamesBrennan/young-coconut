class BaseSerializer
  include JSONAPI::Serializer

  def self_link
    "/api/v1/#{type.underscore}/#{id}"
  end
end
