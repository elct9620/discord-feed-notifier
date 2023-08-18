# frozen_string_literal: true

require 'spec_helper'
require_relative '../app/main'

RSpec.describe 'main.lambda_handler' do
  let(:event) do
    {
      'executionId' => '115bc0b3-fafc-49c0-966b-5878700ffb66',
      'scheduledTime' => '2023-08-18T01:00:00Z',
      'attempt' => '0',
      'feed' => 'https://blog.aotoki.me/index.xml',
      'webhook' => 'https://discord.com/api/webhooks/0000/token'
    }
  end
  let(:context) { {} }

  subject(:response) { lambda_handler(event: event, context: context) }

  it { is_expected.to be_a(Array) }
end
