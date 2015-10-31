require 'spec_helper'

describe FileParser do
  let(:base_path) { 'spec/fixtures' }
  let(:full_path) { "#{base_path}/robots.txt" }
  let(:parser) { FileParser.new(full_path) }

  describe 'initialize' do
    it 'should set the file_path' do
      expect(parser.file_path).to eq full_path
    end

    it 'should initialize parser_actions to be an empty array' do
      expect(parser.parsed_actions).to be_empty
    end
  end

  describe 'parse_actions' do
    let(:expected_actions) do
      [
        { action: :place, x: 1, y: 2, facing: :east },
        { action: :move },
        { action: :move },
        { action: :left },
        { action: :right },
        { action: :move },
        { action: :report }
      ]
    end

    it 'parses the given file into an array of actions' do
      parser.parse_actions
      expect(parser.parsed_actions).to eq expected_actions
    end

    context 'file with empty lines' do
      let(:full_path) { "#{base_path}/patchy_robots.txt" }
      let(:expected_actions) do
        [
          { action: :place, x: 0, y: 0, facing: :north },
          { action: :move },
          { action: :move },
          { action: :report }
        ]
      end

      it 'ignores empty lines' do
        parser.parse_actions
        expect(parser.parsed_actions).to eq expected_actions
      end
    end
  end
end
