require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children

    @board.rows.each do |row|
      row.each do |space|
        
          @next_mover_mark == :x ? mark = :o : mark = :x
         p mark
         child_node = TicTacToeNode.new(@board, mark, space)
         @next_mover_mark = mark
      
      end
    end
  end
end

