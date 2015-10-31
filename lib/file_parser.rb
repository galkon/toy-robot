class FileParser
  attr_reader :file_path, :parsed_actions

  def initialize(file_path)
    @file_path = file_path
    @parsed_actions = []
  end

  def parse_actions
    File.open(file_path, 'r').each_line do |line|
      match = line.match(/(\w+)(.*)/)
      match ? dispatch_action(match) : next
    end
  end

  private

  def dispatch_action(action_matcher)
    action = action_matcher[1]

    if action == 'PLACE'
      action_args = action_matcher[2]
      handle_place_action(action_args)
    else
      @parsed_actions << { action: action.downcase.to_sym }
    end
  end

  def split_args(comma_list)
    comma_list.strip.split(',')
  end

  def place_action(x:, y:, facing:)
    { action: :place, x: x, y: y, facing: facing.downcase.to_sym }
  end

  def handle_place_action(args)
    args = split_args(args)
    action = place_action(
      x: args[0].to_i,
      y: args[1].to_i,
      facing: args[2]
    )
    @parsed_actions << action
  end
end
