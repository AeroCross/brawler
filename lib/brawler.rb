require "json"

class Brawler
  HEROES_DATA_LOCATION = "lib/heroes.json"

  def initialize
    # nothing yet
  end

  # @TODO: pass kwargs to select finding attribute
  # Possible attributes could be name, role, difficuty, franchise, and type
  def self.hero(name)
    new().hero(name)
  end

  def self.ability(name)
    raise NotImplementedError
  end

  def data
    @data ||= JSON.parse(File.open(HEROES_DATA_LOCATION) {|f| f.read }, :symbolize_names => true)
  end

  def hero(name)
    Hero.new(data.find {|hero| hero.fetch(:name) == name})
  end

  def ability
    raise NotImplementedError
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

      def abilities
        raise NotImplementedError
      end

      def traits
        raise NotImplementedError
      end

      def ultimate
        raise NotImplementedError
      end
    end

    attr_reader :name, :title, :description, :role, :type,
                :franchise, :difficulty, :release_date
  end

  class Ability
    def initialize(ability)
      @name                 = ability[:name]
      @description          = ability[:description]
      @shortcut             = ability[:shortcut]
      @cooldown             = ability[:cooldown]
      @mana_cost            = ability[:manaCost]
      @mana_cost_per_second = ability[:manaCostPerSecond]
      @aim_type             = ability[:aimType]

      # @TODO: these two should be their own classes, maybe
      @heroic               = ability[:heroic]
      @trait                = ability[:trait]
      @mount                = ability[:mount]
    end

    attr_reader :name, :description, :shortcut, :cooldown, :mana_cost, :mana_cost_per_second
                :aim_type, :heroic, :trait, :mount
  end
end
