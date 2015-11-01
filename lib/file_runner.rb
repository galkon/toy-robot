class FileRunner
  def initialize(file)
    @simulation = Simulation.new
    @parser = FileParser.new(file)
    parse_actions
  end

  def execute_actions
    parser.parsed_actions.each do |action|
      if action[:action] == :place
        handle_place_action(action)
      else
        simulation.send(action[:action].downcase)
      end
    end
  end

  private

  attr_reader :simulation, :parser

  def handle_place_action(action)
    args = action.reject { |k, _v| k == :action }
    simulation.send(action[:action].downcase, args)
  end

  def parse_actions
    @parser.parse_actions
  end
end
