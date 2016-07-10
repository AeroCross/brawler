require "spec_helper"
require "brawler/data"

RSpec.describe Brawler::Data do
  describe "class methods" do
    subject(:test) { described_class.test }

      it "loads the Heroes JSON data" do
        expect(test).to eq("test")
      end
  end
end
