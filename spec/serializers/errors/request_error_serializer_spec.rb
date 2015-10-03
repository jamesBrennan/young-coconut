require 'spec_helper'
require 'json'
require_relative '../../../app/models/errors/request_error'
require_relative '../../../app/serializers/errors/request_error_serializer'

module Errors
  describe RequestErrorSerializer do
    let(:status) { 400 }
    let(:title) { 'Not Found' }
    let(:detail) { nil }
    let(:meta) { nil }
    let(:error_attrs) { { status: status, title: title, detail: detail, meta: meta } }
    let(:request_error) { Errors::RequestError.new error_attrs }

    subject(:output) { described_class.serialize(request_error) }

    it 'returns parseable json' do
      parsed = JSON.parse output
      expect(parsed['error']['status']).to eq status
    end
  end
end
