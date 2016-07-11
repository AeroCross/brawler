require_relative "../data"
require_relative "../hero"

module Brawler
  module Finder
    class HeroFinder
      def initialize(data = nil)
        if data
          @data = data
        end
      end

      def by_name(name)
        hero = find(:name, name)
        unless hero.nil?
          Brawler::Hero.new(hero)
        end
      end

      def by_role(role)
        find_all_matching(:role, role).map do |hero|
          Brawler::Hero.new(hero)
        end
      end

      def all
        data.map do |hero|
          Brawler::Hero.new(hero)
        end
      end

      private

      def find(key, value)
        data.find {|hero| hero.fetch(key) == value}
      end

      def find_all_matching(key, value)
        data.select {|hero| hero.fetch(key) == value}
      end

      def data
        @data ||= Brawler::Data.load
      end
    end
  end
end
