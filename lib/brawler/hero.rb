module Brawler
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
  end
