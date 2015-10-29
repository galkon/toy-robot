require 'direction'

describe Direction do
  let(:direction) { Direction.new(:east) }

  context 'attributes' do
    it "has a value of east" do
      expect(direction.value).to eq :east
    end
  end
end