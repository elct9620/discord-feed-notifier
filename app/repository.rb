# frozen_string_literal: true

require 'rss'
require 'net/http'
require_relative 'entity'

# :nodoc:
class HttpFeedRepository
  def list(uri)
    rss = Net::HTTP.get(uri)
    feed = RSS::Parser.parse(rss)
    feed.items.map do |item|
      Post.new(
        item.link,
        item.title,
        item.link,
        item.pubDate
      )
    end
  end
end
