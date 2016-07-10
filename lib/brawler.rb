require_relative "brawler/data"
require_relative "brawler/hero"
require_relative "brawler/ability"

module Brawler
  # @TODO: pass kwargs to select finding attribute
  # Possible attributes could be name, role, difficuty, franchise, and type
  def self.hero(name)
    Finder::HeroFinder.by_name(name)
  end

  # Due to the simplicity of the abilities hash, only search by name, and probably
  # by the fact that they're heroics or talent
  def self.ability(name)
    raise NotImplementedError
  end
end
