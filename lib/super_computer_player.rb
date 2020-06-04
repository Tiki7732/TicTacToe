require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    moves = node.children.shuffle
    winning_moves = moves.select {|child| child.winning_node?(mark)}


    return winning_moves.first.prev_move_pos unless winning_moves.empty?

    blocking_moves = moves.select {|child| !child.losing_node?(mark)}
    return blocking_moves.first.prev_move_pos unless blocking_moves.empty?
    raise "No available moves"

  end
 
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
