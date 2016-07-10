require "json"

class Brawler
  HEROES_DATA_LOCATION = "lib/heroes.json"

  # @TODO: pass kwargs to select finding attribute
  # Possible attributes could be name, role, difficuty, franchise, and type
  def self.hero(name)
    new().hero(name)
  end

  # Due to the simplicity of the abilities hash, only search by name, and probably
  # by the fact that they're heroics or talens
  def self.ability(name)
    raise NotImplementedError
  end

  def hero(name)
    # This should be using a finder.
    Hero.new(data.find {|hero| hero.fetch(:name) == name})
  end

  private

  # User a JSON loader? Too much?
  def data
    @data ||= JSON.parse(File.open(HEROES_DATA_LOCATION) {|f| f.read }, :symbolize_names => true)
  end
end
