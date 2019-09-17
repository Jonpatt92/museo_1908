require './lib/photograph'
require './lib/artist'

class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

end
