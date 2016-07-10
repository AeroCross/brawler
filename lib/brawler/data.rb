class Brawler
  class Data
    HEROES_DATA_LOCATION = File.join(File.dirname(__FILE__), "heroes.json")

    def self.load
      new().load_data
    end

    def load
      JSON.parse(File.open(HEROES_DATA_LOCATION) {|f| f.read }, :symbolize_names => true)
    end
  end
end
