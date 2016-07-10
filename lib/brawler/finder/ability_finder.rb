module Brawler
  module Finder
    class AbilityFinder
      def self.all
        raise NotImplementedError
      end

      def self.heroics
        raise NotImplementedError
      end

      def self.traits
        raise NotImplementedError
      end

      def self.mounts
        # There is a possibility that a different set of data is required.
        # Be sure to check if this exists in heroes.json
        raise NotImplementedError
      end

      def self.for_hero
        raise NotImplementedError
      end

      def self.by_name
        raise NotImplementedError
      end

      def initialize(data)
        if data
          @data = data
        end
      end
    end
  end
end
