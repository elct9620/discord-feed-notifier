# frozen_string_literal: true

require 'json'
require 'discordrb/webhooks'
require 'active_support'
require 'active_support/core_ext'

require_relative 'event'
require_relative 'repository'
require_relative 'service'

# :nodoc:
class App
  attr_reader :event

  def initialize(event:, **_args)
    @event = event
  end

  def call
    end_at = event.time.beginning_of_hour
    start_at = end_at - 1.day

    posts = feed.list_between(event.uri, start_at, end_at)
    builders = posts.map { |post| service.to_builder(post) }
    builders.each { |builder| discord.execute(builder) }
  end

  def discord
    @discord ||= Discordrb::Webhooks::Client.new(url: event.webhook)
  end

  def feed
    @feed ||= HttpFeedRepository.new
  end

  def service
    @service ||= DiscordService.new
  end
end

def lambda_handler(event:, **_args)
  Time.zone = event['timezone'] || 'Asia/Taipei'
  event = ScheduleEvent.new(event)

  App.new(event: event).call
end
