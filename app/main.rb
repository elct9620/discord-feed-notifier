# frozen_string_literal: true

require 'json'

require_relative 'event'
require_relative 'repository'

def lambda_handler(event:, **_args)
  event = ScheduleEvent.new(event)
  HttpFeedRepository.new.list(event.uri)
end
