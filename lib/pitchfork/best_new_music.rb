require 'open-uri'
require 'nokogiri'

module Pitchfork
  class BestNewMusic

    def initialize(doc)
      @doc = Nokogiri::HTML(doc, nil, 'UTF-8')
    end

    def albums
      parse_doc
    end

    private
    attr_reader :doc

    def parse_doc
      doc.css('ul.bnm-list > li').map do |album|
        Pitchfork::Album.new(
          artwork: parse_artwork(album),
          title: parse_title(album),
          artist: parse_artist(album),
          rating: parse_rating(album),
          review: parse_review(album)
        )
      end
    end

    def parse_artwork(album)
      album.at_css('div.artwork img').attr('src')
    end

    def parse_title(album)
      album.at_css('div.info h2').text
    end

    def parse_artist(album)
      album.at_css('div.info h1').text
    end

    def parse_rating(album)
      album.at_css('div.info span.score').text.strip
    end

    def parse_review(album)
      album.at_css('div.editorial p').inner_html
    end
  end
end