require "spec_helper"
require "brawler/finder/hero_finder"

RSpec.describe Brawler::Finder::HeroFinder do
  let(:tassadar) { instance_double(Brawler::Hero, :name => "Tassadar", :role => "Support") }
  let(:valla) { instance_double(Brawler::Hero, :name => "Valla", :role => "Assassin") }
  let(:rehgar) { instance_double(Brawler::Hero, :name => "Rehgar", :role => "Support") }
  let(:diablo) { instance_double(Brawler::Hero, :name => "Diablo", :role => "Warrior") }

  let(:hero_data) do
    [
      { :name => "Tassadar", :role => "Support" },
      { :name => "Valla", :role => "Assassin" },
      { :name => "Rehgar", :role => "Support" },
      { :name => "Diablo", :role => "Warrior" },
    ]
  end

  before do
    allow(Brawler::Data).to receive(:load).and_return(hero_data)
    allow(Brawler::Hero).to receive(:new).with(hero_data[0]).and_return(tassadar)
    allow(Brawler::Hero).to receive(:new).with(hero_data[1]).and_return(valla)
    allow(Brawler::Hero).to receive(:new).with(hero_data[2]).and_return(rehgar)
    allow(Brawler::Hero).to receive(:new).with(hero_data[3]).and_return(diablo)
  end

  describe "Instance methods" do
    describe "#all" do
      subject(:all) { described_class.new().all }
      let(:expected_heroes) { [tassadar, valla, rehgar, diablo] }

      it "returns all the heroes available" do
        expect(all).to match_array(expected_heroes)
      end
    end

    describe "#by_name" do
      subject(:by_name) { described_class.new().by_name(name) }

      context "when the Hero exists" do
        let(:name) { "Tassadar" }

        it "returns information of a Hero" do
          expect(by_name).to eq(tassadar)
        end
      end

      context "when the hero does not exist" do
        let(:name) { "Lothar" }

        it "returns nil" do
          expect(by_name).to eq(nil)
        end
      end
    end

    describe "#by_role" do
      subject(:by_role) { described_class.new().by_role(role) }

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
