require_relative "brawler/data"
require_relative "brawler/hero"
require_relative "brawler/ability"
require_relative "brawler/finder/hero_finder"

module Brawler
  # @TODO: pass kwargs to select finding attribute
  # Possible attributes could be name, role, difficuty, franchise, and type
  def self.hero(value, by: :name)
    hero_finder = Finder::HeroFinder.new

    case by
    when :name
      hero_finder.by_name(value)
    when :role
      hero_finder.by_role(value)
    else
      nil
    end
  end

  # Due to the simplicity of the abilities hash, only search by name, and probably
  # by the fact that they're heroics or talent
  def self.ability(name)
    raise NotImplementedError
  end
end
