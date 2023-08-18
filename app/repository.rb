# frozen_string_literal: true

require 'rss'
require 'net/http'

# :nodoc:
class HttpFeedRepository
  def list(uri)
    rss = Net::HTTP.get(uri)
    feed = RSS::Parser.parse(rss)
    feed.items
  end
end
