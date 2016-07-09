require "rspec"
require_relative "../lib/brawler.rb"

RSpec.describe(Brawler) do
  describe "#hero" do
    subject(:hero) { described_class.hero("Abathur")}
    it "it returns a given hero" do
      expect(hero.name).to eq("Abathur")
      expect(hero.title).to eq("Evolution Master")
      expect(hero.description).to include("Does not directly engage in combat")
      expect(hero.role).to eq("Specialist")
      expect(hero.type).to eq("Melee")
      expect(hero.franchise).to eq("Starcraft")
      expect(hero.difficulty).to eq("Very Hard")
      expect(hero.release_date).to eq("2014-01-01")
    end
  end
end
