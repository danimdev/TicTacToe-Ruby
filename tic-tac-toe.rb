# how to play
# 
# you just type in the index of the field you want to place your symbol into
# after that the script will check if its a correct input and if it worked
# you will see it on the tic tac toe map
# 
# how it works
#
# it works by having two loops where its clearing everything first
# then printing out the tic tac toe map after that telling the user wich 
# player turn it is and then allowing the user to input commands or 
# the field he wants his symbol placed into
#
#


#field indexer and string 
index  = 1
field_str = ""


#booleans
is_game_over = false
is_game_running = true
player1 = true
player2 = false


#array
field = Array.new
field = %w( 0 1 2 3 4 5 6 7 8 9)


while is_game_running
    until is_game_over
        system "clear"


        #print the field
        until index == 10
            field_str = "|_#{field[index]}_|"
            index += 1
            if index == 4
                field_str += "\n"
            elsif index == 7
                field_str += "\n"
            end
            print field_str
        end


        puts "\n\n"
        player_turn = player1 ? "Turn for X" : "Turn for O"
        puts player_turn


        puts "wich field do you want to set?"
        print "field:"
        input = gets.chomp


        #commands and exceptions
        if input == "exit"
            is_game_over = true
            is_game_running = false
            puts "Game Over"
            break
        elsif input == "clear"
            field = %w( 0 1 2 3 4 5 6 7 8 9)
        elsif input.to_i >= 10
            puts "not a valid field"
            sleep 1
            index = 1
            break
        end


        input = input.to_i


        #player state machine
        unless field[input] != "X" && field[input] != "O"
            puts "field is already set"
            sleep 1
        else
            if input == 0
                puts "not a valid input"
                sleep 1
                index = 1
                break
            elsif player1
                field[input] = "X"
                player1 = false
                player2 = true
            elsif player2
                field[input] = "O"
                player1 = true
                player2 = false
            end
        end


        index = 1

        #implement game logic like what happens at specific points in the game results and end of the game at all
    end
end