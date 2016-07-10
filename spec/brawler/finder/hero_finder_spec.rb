require "spec_helper"
require "brawler/finder/hero_finder"

RSpec.describe Brawler::Finder::HeroFinder do
  describe "class methods" do
    describe ".find_by_name" do
      subject(:find_by_name) { described_class.find_by_name("Thrall") }

      it "returns information of a Hero" do
        expect(find_by_name.title).to eq("Warchief of the Horde")
      end
    end
  end
end
