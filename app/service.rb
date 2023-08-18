# frozen_string_literal: true

require 'discordrb/webhooks'

# :nodoc:
class DiscordService
  TEMPLATE = <<~TEMPLATE
    新文章「%<title>s」
    %<link>s
  TEMPLATE

  def to_builder(post)
    Discordrb::Webhooks::Builder.new(content: format(TEMPLATE, title: post.title, link: post.link))
  end
end
