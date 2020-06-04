require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    t_node = TicTacToeNode.new(game.board, mark)
    winning_nodes = t_node.children.select {|child| child.winning_node?(mark)}
    return winning_nodes.first.prev_move_pos unless winning_nodes.empty?
    non_loosing_moves = t_node.children.select {|child| !child.losing_node?(mark)}
    return non_loosing_moves.first.prev_move_pos unless non_loosing_moves.empty?


    raise "No available moves"

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
