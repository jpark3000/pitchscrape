module Pitchscrape
  class Album
    attr_reader :artist, :title, :rating, :label,
                :review, :review_date, :artwork

    def initialize(attributes = {})
      @artist = attributes[:artist]
      @title = attributes[:title]
      @rating = attributes[:rating]
      @review = attributes[:review]
      @artwork = attributes[:artwork]
    end
  end
end