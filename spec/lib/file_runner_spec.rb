require 'spec_helper'

describe FileRunner do
  let(:file)            { 'spec/fixtures/complicated_robots.txt' }
  let(:file_runner)     { FileRunner.new(file) }
  let(:expected_output) { "Robot: [x = 0, y = 4, facing = west]\n" }

  it 'sends the correct position to stdout' do
    expect { file_runner.execute_actions }.to output(expected_output).to_stdout
  end
end
