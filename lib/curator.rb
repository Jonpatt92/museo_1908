require './lib/photograph'
require './lib/artist'
require './lib/fileio'
require 'pry'

class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def load_photos(file)
    loaded_photos =  []
    photos = []
    photos =  FileIO.load_photographs(file)

    photos.each do |photo|
    loaded_photos << Photograph.new(photo)
    end
    loaded_photos.each do |photo|
      @photographs << photo
      # loaded_photos.index(photo) = photo
      # @photographs << photo.index
    end
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      photos = @photographs.find_all do |photo|
          photo.artist_id == artist.id
      end
      photos.count >= 2
    end
  end

  def photographs_taken_by_artist_from(country)
    country_artists = @artists.find_all do |artist|
      country == artist.country
    end
    @photographs.find_all do |photo|
      country_artists.any? do |artist|
        artist.id == photo.artist_id
      end
    end
  end

end
