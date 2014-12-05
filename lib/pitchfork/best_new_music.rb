require 'open-uri'
require 'nokogiri'

module Pitchfork
  class BestNewMusic
    BNM_URL = 'http://www.pitchfork.com/reviews/best/albums'
    class << self
      def albums(page = 1)
        parse_doc(page)
      end

      private

      def doc(page)
        Nokogiri::HTML(open("#{BNM_URL}/#{page}"), nil, 'UTF-8').css('ul.bnm-list > li')
      end

      def parse_doc(page)
        doc(page).map do |album|
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
        Nokogiri::HTML(album.at_css('div.lazy').attr('data-content')).at_css('img').attr('src')
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
        sanitize(album.at_css('div.editorial').inner_html)
      end

      def sanitize(html)
        html.gsub(/<p>|<\/p>|\n/, '').strip
      end
    end
  end
end