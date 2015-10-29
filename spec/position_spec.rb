require 'position'

describe Position do
  let(:position) { Position.new(0, 1) }

  context "attributes" do
    it "has an x attribute of 0" do
      expect(position.x).to eq 0
    end

    it "has a y attribute of 1" do
      expect(position.y).to eq 1
    end
  end

  describe "to_s" do
    it "returns the positions state" do
      expect(position.to_s).to eq "x = 0, y = 1"
    end
  end
end