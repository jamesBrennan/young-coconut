require 'spec_helper'
require_relative '../../../app/models/errors/request_error'

module Errors
  describe RequestError do
    let(:status) { 400 }
    let(:title) { 'Not Found' }
    let(:detail) { nil }
    let(:meta) { nil }
    let(:error_attrs) { { status: status, title: title, detail: detail, meta: meta } }

    subject(:request_error) { Errors::RequestError.new error_attrs }

    describe 'code' do
      it 'returns the class name' do
        expect(request_error.code).to eq 'RequestError'
      end
    end

    describe 'to_h' do
      it 'returns the attrs with the code' do
        expected_hash = { code: request_error.code }.merge error_attrs
        expect(request_error.to_h).to eq expected_hash
      end
    end
  end
end
