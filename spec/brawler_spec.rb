require "rspec"
require "brawler"
require "brawler/data"
require "brawler/finder/hero_finder"

RSpec.describe(Brawler) do
  describe "Class methods" do
    describe ".hero" do
      subject(:hero) { described_class.hero(value, by: find_by) }
      let(:hero_finder) { instance_double(Brawler::Finder::HeroFinder) }

      before(:each) { hero }
      before do
        allow(Brawler::Finder::HeroFinder).to receive(:new).and_return(hero_finder)
        allow(hero_finder).to receive(:by_name)
        allow(hero_finder).to receive(:by_role)
      end

      context "when finding heroes by name" do
        let(:find_by) { :name }
        let(:value) { "Anub'arak" }

        it "calls the appropriate methods" do
          expect(hero_finder)
            .to have_received(:by_name)
            .with(value)
        end
      end

      context "when finding heroes by role" do
        let(:find_by) { :role }
        let(:value) { "Specialist" }

        it "calls the appropriate methods" do
          expect(hero_finder)
            .to have_received(:by_role)
            .with(value)
        end
      end
    end

    describe ".ability" do
      subject(:ability) { described_class.ability("Sundering") }

      it "returns the attributes of an ability"
    end
  end
end
