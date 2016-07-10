require "spec_helper"
require "brawler/finder/hero_finder"

RSpec.describe Brawler::Finder::HeroFinder do
  let(:hero) { "Valla" }
  let(:role) { "Assassin" }

  describe "class methods" do
    describe ".by_name" do
      subject(:by_name) { described_class.by_name(hero) }

      context "when the Hero exists" do
        let(:hero) { "Thrall" }

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

    describe ".by_role" do
      subject(:by_role) { described_class.by_role(role) }

      let(:data) do
        [
          { :name => "Tassadar", :role => "Support" },
          { :name => "Valla", :role => "Assassin" },
          { :name => "Rehgar", :role => "Support" },
        ]
      end

      let(:tassadar) { instance_double(Brawler::Hero, :name => "Tassadar", :role => "Support") }
      let(:rehgar) { instance_double(Brawler::Hero, :name => "Rehgar", :role => "Support") }

      before do
        allow(Brawler::Data).to receive(:load).and_return(data)
        allow(Brawler::Hero).to receive(:new).with(data[0]).and_return(tassadar)
        allow(Brawler::Hero).to receive(:new).with(data[2]).and_return(rehgar)
      end

      context "when the role exists" do
        let(:role) { "Support" }
        let(:expected_heroes) { [tassadar, rehgar] }

        it "returns an array of all the heroes who match a role" do
          expect(by_role).to match_array(expected_heroes)
        end
      end

      context "when the role does not exist" do
        let(:role) { "Jungler" }
        it "returns nil" do
          expect(by_role).to eq([])
        end
      end
    end
  end
end
