require "spec_helper"
require "brawler/finder/hero_finder"

RSpec.describe Brawler::Finder::HeroFinder do
  let(:hero) { "Thrall" }
  let(:role) { "Support" }

  describe "class methods" do
    describe ".by_name" do
      subject(:by_name) { described_class.by_name(hero) }

      context "when the Hero exists" do
        it "returns information of a Hero" do
          expect(by_name.name).to eq("Thrall")
          expect(by_name.title).to eq("Warchief of the Horde")
        end
      end

      context "when the hero does not exist" do
        let(:hero) { "Lothar" }

        it "returns nil" do
          expect(by_name).to eq(nil)
        end
      end
    end
  end
end
