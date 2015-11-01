require 'spec_helper'

describe FileRunner do
  let(:runner) { FileRunner.new(file) }

  context 'complicated robots file' do
    let(:file)            { 'spec/fixtures/complicated_robots.txt' }
    let(:expected_output) { "Robot: [x = 0, y = 4, facing = west]\n" }

    it 'sends the correct position to stdout' do
      expect { runner.execute_actions }.to output(expected_output).to_stdout
    end
  end

  context 'robot not placed file' do
    let(:file)            { 'spec/fixtures/robot_not_placed.txt' }
    let(:expected_output) { "\n" }

    it "doesn't raise any exceptions" do
      expect { runner.execute_actions }.to_not raise_error
    end

    it 'outputs nothing' do
      expect { runner.execute_actions }.to output(expected_output).to_stdout
    end
  end
end
