# frozen_string_literal: true

require 'uri'

# :nodoc:
class ScheduleEvent
  attr_reader :id, :time, :duration, :feed, :webhook

  def initialize(event)
    @id = event['executionId']
    @time = Time.zone.parse(event['scheduledTime'])
    @feed = event['feed']
    @duration = ActiveSupport::Duration.parse(event['duration'] || 'P1D')
    @webhook = event['webhook']
  end

  def uri
    URI(feed)
  end
end
