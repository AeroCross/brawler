require "json"

class Brawler
  HEROES_DATA_LOCATION = "lib/heroes.json"

  def initialize
    # nothing yet
  end

  # @TODO: pass kwargs to select finding attribute
  def self.hero(name)
    new().hero(name)
  end

  def data
    @data ||= JSON.parse(File.open(HEROES_DATA_LOCATION) {|f| f.read }, :symbolize_names => true)
  end

  def hero(name)
    Hero.new(data.find {|hero| hero.fetch(:name) == name})
  end

  class Hero
    def initialize(hero)
      @name           = hero[:name]
      @title          = hero[:title]
      @description    = hero[:description]
      @role           = hero[:role]
      @type           = hero[:type]
      @franchise      = hero[:franchise]
      @difficulty     = hero[:difficulty]
      @release_date   = hero[:releaseDate]

      # @TODO: add ratings
      # @TODO: add stats
      # @TODO: add abilities
      # @TODO: add talents
    end

    attr_reader :name, :title, :description, :role, :type,
                :franchise, :difficulty, :release_date
  end
end
