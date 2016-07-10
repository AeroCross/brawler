require_relative "../data"
require_relative "../hero"

module Brawler
  module Finder
    class HeroFinder
      def self.by_name(name)
        new().find_by_name(name)
      end

      def self.by_role(role)
        new().find_by_role(role)
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

      def find_by_role(role)
        find_all(:role, role).map do |hero|
          Brawler::Hero.new(hero)
        end
      end

      private

      def find(key, value)
        data.find {|hero| hero.fetch(key) == value}
      end

      def find_all(key, value)
        data.select {|hero| hero.fetch(key) == value}
      end

      def data
        @data ||= Brawler::Data.load
      end
    end
  end
end
