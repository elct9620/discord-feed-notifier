# frozen_string_literal: true

require 'spec_helper'
require_relative '../app/main'

RSpec.describe 'main.lambda_handler' do
  let(:event) do
    {
      'executionId' => '115bc0b3-fafc-49c0-966b-5878700ffb66',
      'scheduledTime' => '2024-10-04T01:00:00Z',
      'attempt' => '0',
      'feed' => 'https://blog.aotoki.me/index.xml',
      'webhook' => 'https://discord.com/api/webhooks/0000/token'
    }
  end
  let(:context) { {} }

  before do
    stub_request(:any, 'https://discord.com/api/webhooks/0000/token')
    stub_request(:any, 'https://blog.aotoki.me/index.xml')
      .to_return(body: File.read('spec/fixtures/feed.xml'))
  end

  subject(:response) { lambda_handler(event:, context:) }

  it { is_expected.to be_a(Array) }
  it { is_expected.to have_attributes(size: 1) }
  it { is_expected.to include(have_attributes(content: /架構規劃 - 重新思考 Rails 架構/)) }
  it { is_expected.to include(have_attributes(content: %r{https://blog.aotoki.me/posts/2024/10/04/rethink-rails-architecture-planning-architecture/})) }
end
