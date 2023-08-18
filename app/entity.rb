# frozen_string_literal: true

class Post
  attr_reader :id, :title, :link, :published_at

  def initialize(id, title, link, published_at)
    @id = id
    @title = title
    @link = link
    @published_at = published_at
  end
end
