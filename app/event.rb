# frozen_string_literal: true

require 'uri'

# :nodoc:
class ScheduleEvent
  attr_reader :id, :time, :feed, :webhook

  def initialize(event)
    @id = event['executionId']
    @time = Time.parse(event['scheduledTime'])
    @feed = event['feed']
    @webhook = event['webhook']
  end

  def uri
    URI(feed)
  end
end
