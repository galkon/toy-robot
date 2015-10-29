require 'direction'

describe Direction do
  let(:value)     { :east }
  let(:direction) { Direction.new(value) }

  context "attributes" do
    it "has a value of east" do
      expect(direction.value).to eq :east
    end
  end

  describe "#left_direction" do
    context "direction is north" do
      let(:value)              { :north }
      let(:expected_direction) { Direction.new(:west) }

      it "returns a west direction object" do
        expect(direction.left_direction).to eql expected_direction
      end
    end

    context "direction is east" do
      let(:value)              { :east }
      let(:expected_direction) { Direction.new(:north) }

      it "returns a north direction object" do
        expect(direction.left_direction).to eql expected_direction
      end
    end

    context "direction is south" do
      let(:value)              { :south }
      let(:expected_direction) { Direction.new(:east) }

      it "returns a east direction object" do
        expect(direction.left_direction).to eql expected_direction
      end
    end

    context "direction is west" do
      let(:value)              { :west }
      let(:expected_direction) { Direction.new(:south) }

      it "returns a south direction object" do
        expect(direction.left_direction).to eql expected_direction
      end
    end
  end

  describe "#right_direction" do
    context "direction is north" do
      let(:value)              { :north }
      let(:expected_direction) { Direction.new(:east) }

      it "returns a east direction object" do
        expect(direction.right_direction).to eql expected_direction
      end
    end

    context "direction is east" do
      let(:value)              { :east }
      let(:expected_direction) { Direction.new(:south) }

      it "returns a south direction object" do
        expect(direction.right_direction).to eql expected_direction
      end
    end

    context "direction is south" do
      let(:value)              { :south }
      let(:expected_direction) { Direction.new(:west) }

      it "returns a west direction object" do
        expect(direction.right_direction).to eql expected_direction
      end
    end

    context "direction is west" do
      let(:value)              { :west }
      let(:expected_direction) { Direction.new(:north) }

      it "returns a north direction object" do
        expect(direction.right_direction).to eql expected_direction
      end
    end
  end

  describe "to_s" do
    it "returns the state of the direction" do
      expect(direction.to_s).to eq "value = east"
    end
  end
end