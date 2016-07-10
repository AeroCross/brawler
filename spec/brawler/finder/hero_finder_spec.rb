require "spec_helper"
require "brawler/finder/hero_finder"

RSpec.describe Brawler::Finder::HeroFinder do
  let(:tassadar) { instance_double(Brawler::Hero, :name => "Tassadar", :role => "Support") }
  let(:valla) { instance_double(Brawler::Hero, :name => "Valla", :role => "Assassin") }
  let(:rehgar) { instance_double(Brawler::Hero, :name => "Rehgar", :role => "Support") }
  let(:diablo) { instance_double(Brawler::Hero, :name => "Diablo", :role => "Warrior") }

  let(:data) do
    [
      { :name => "Tassadar", :role => "Support" },
      { :name => "Valla", :role => "Assassin" },
      { :name => "Rehgar", :role => "Support" },
      { :name => "Diablo", :role => "Warrior" },
    ]
  end

  before do
    allow(Brawler::Data).to receive(:load).and_return(data)
    allow(Brawler::Hero).to receive(:new).with(data[0]).and_return(tassadar)
    allow(Brawler::Hero).to receive(:new).with(data[1]).and_return(valla)
    allow(Brawler::Hero).to receive(:new).with(data[2]).and_return(rehgar)
    allow(Brawler::Hero).to receive(:new).with(data[3]).and_return(diablo)
  end

  describe "class methods" do
    describe ".all" do
      subject(:all) { described_class.all }

      let(:expected_heroes) { [tassadar, valla, rehgar, diablo] }

      it "returns all the heroes available" do
        expect(all).to match_array(expected_heroes)
      end
    end

    describe ".by_name" do
      subject(:by_name) { described_class.by_name(hero) }

      context "when the Hero exists" do
        let(:hero) { "Tassadar" }

        it "returns information of a Hero" do
          expect(by_name).to eq(tassadar)
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
