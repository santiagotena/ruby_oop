class Game
    def initialize
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        @tally_p1 = [0,0,0,0,0,0,0,0,0]
        @tally_p2 = [0,0,0,0,0,0,0,0,0]
    end
    
    def display_board
        puts "[#{@board[0]},#{@board[1]},#{@board[2]}]\n[#{@board[3]},#{@board[4]},#{@board[5]}]\n[#{@board[6]},#{@board[7]},#{@board[8]}]"
    end

    def modify_board(player,position, character)
        @board[position-1] = character
        if player == "Player 1"
            @tally_p1[position-1] = 1
        elsif player == "Player 2"
            @tally_p2[position-1] = 2
        end
    end

    def stop_playing?(player)

        if player == "Player 1"

            if @tally_p1[0]+@tally_p1[1]+@tally_p1[2] == 3 ||
                @tally_p1[3]+@tally_p1[4]+@tally_p1[5] == 3 ||
                @tally_p1[6]+@tally_p1[7]+@tally_p1[8] == 3 ||
                @tally_p1[0]+@tally_p1[3]+@tally_p1[6] == 3 ||
                @tally_p1[1]+@tally_p1[4]+@tally_p1[7] == 3 ||
                @tally_p1[2]+@tally_p1[5]+@tally_p1[8] == 3 ||
                @tally_p1[0]+@tally_p1[4]+@tally_p1[8] == 3 ||
                @tally_p1[6]+@tally_p1[4]+@tally_p1[2] == 3

                puts "#{player} has won"
                return true
            else
                return false
            end
        end

        if player == "Player 2"

            if @tally_p2[0]+@tally_p2[1]+@tally_p2[2] == 6 ||
                @tally_p2[3]+@tally_p2[4]+@tally_p2[5] == 6 ||
                @tally_p2[6]+@tally_p2[7]+@tally_p2[8] == 6 ||
                @tally_p2[0]+@tally_p2[3]+@tally_p2[6] == 6 ||
                @tally_p2[1]+@tally_p2[4]+@tally_p2[7] == 6 ||
                @tally_p2[2]+@tally_p2[5]+@tally_p2[8] == 6 ||
                @tally_p2[0]+@tally_p2[4]+@tally_p2[8] == 6 ||
                @tally_p2[6]+@tally_p2[4]+@tally_p2[2] == 6

                puts "#{player} has won"
                return true
            else
                return false
            end
        end

    end

end

#Launch session
session = Game.new
turns = 0
#Display board
session.display_board

for i in 1..5

    #Ask for input player 1, display, check for winner
    puts "Player 1, please enter your move position:"
    position = gets.chomp.to_i
    session.modify_board("Player 1",position, "O")

    session.display_board

    if session.stop_playing?("Player 1")
        session.display_board
        break 
    end

    turns +=1
    if turns == 9
        puts "It is a draw"
        break
    end

    #Ask for input player 2, display, check for winner
    puts "Player 2, please enter your move position:"
    position = gets.chomp.to_i
    session.modify_board("Player 2",position, "X")

    session.display_board

    if session.stop_playing?("Player 2")
        session.display_board
        break 
    end

    turns +=1
end

# board = "[1,2,3]\n[4,5,6]\n[7,8,9]"
# b = [1, 2, 3, 4, 5, 6, 7, 8, 9]

#"[#{board[0]},#{board[1]},#{board[2]}]\n[#{board[3]},#{board[4]},#{board[5]}]\n[#{board[6]},#{board[7]},#{board[8]}]"
#"[#{@board[0]},#{@board[1]},#{@board[2]}]\n[#{@board[3]},#{@board[4]},#{@board[5]}]\n[#{@board[6]},#{@board[7]},#{@board[8]}]"