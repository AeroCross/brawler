module Brawler
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

    attr_reader :name, :description, :shortcut, :cooldown, :mana_cost, :mana_cost_per_second,
                :aim_type, :heroic, :trait, :mount
  end
end
