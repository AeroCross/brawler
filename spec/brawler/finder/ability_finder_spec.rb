require "spec_helper"
require "brawler/finder/ability_finder"

RSpec.describe Brawler::Finder::AbilityFinder do
  describe "class methods" do
    describe ".for_hero" do
      # This should accept both raw data or a Brawler::Hero instance
      it "returns an array all the abilities for a given hero"
    end
  end
end
