require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)
    if board.over?
      return true if board.won? && board.winner != evaluator
      return false
    end
    if evaluator == self.next_mover_mark
      self.children.all? { |child| child.losing_node?(evaluator)}
    else
      self.children.any? { |child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  #the current move.
  def children
    mark = @next_mover_mark
    mark == :x ? mark = :o : mark = :x
    children_arr = []
    @board.rows.each.with_index do |row, ind1|
      row.each.with_index do |space, ind2|
        pos = [ind1, ind2]
          if @board.empty?(pos)
            new_board = board.dup
            new_board[pos] = @next_mover_mark
            child_node = TicTacToeNode.new(new_board, mark, pos)
            children_arr.push(child_node)
           
          end
      end
    end
    children_arr
  end
end

