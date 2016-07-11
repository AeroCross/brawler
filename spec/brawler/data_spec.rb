require "spec_helper"
require "brawler/data"

RSpec.describe Brawler::Data do
  describe "Class methods" do
    describe ".load" do
      subject(:heroes_data) { described_class.load }

      it "loads the Heroes JSON data" do
        expect(heroes_data).to be_kind_of(Enumerable)
      end

      it "has the expected data" do
        expect(heroes_data.first).to include(:name)
        expect(heroes_data.first).to include(:title)
        expect(heroes_data.first).to include(:ratings)
        expect(heroes_data.first).to include(:stats)
        expect(heroes_data.first).to include(:abilities)
        expect(heroes_data.first).to include(:talents)
      end
    end
  end
end
