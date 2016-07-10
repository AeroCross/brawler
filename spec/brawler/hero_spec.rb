require "spec_helper"
require "brawler/hero"

RSpec.describe Brawler::Hero do
  let(:data) do
    {
      :brightwing_hero_id => [
        { :name => "Arcane Flare", :shortcut => "Q" },
        { :name => "Polymorph", :shortcut => "W" },
        { :name => "Pixie Dust", :shortcut => "E" },
        { :name => "Snipe", :shortcut => "R" },
      ]
    }
  end
  describe "instance methods" do
    describe "#abilities" do
      subject(:abilities) { described_class.new(data).abilities }

      it "returns an array of all the hero abilities"
    end
  end
end
