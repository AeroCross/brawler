require "brawler/data"
require "brawler/hero"

module Brawler
  module Finder
    class HeroFinder
      def self.by_name(name)
        new().find_by_name(name)
      end

      def initialize(data = nil)
        if data
          @data = data
        end
      end

      def find_by_name(name)
        hero = find(:name, name)

        # Should this method take care of the responsibility of being nil?
        # Should it be Brawler::Hero?
        if hero
          Brawler::Hero.new(hero)
        else
          nil
        end
      end

      private

      def find(key, value)
        data.find {|hero| hero.fetch(key) == value}
      end

      def data
        @data ||= Brawler::Data.load
      end
    end
  end
end
