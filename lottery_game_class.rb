require "securerandom"

class LotteryGame
    def game_init(player_name)
        puts "Welcome to 'What number combination I am thinking game'"
        puts "\n\n"
        puts "Very well #{player_name}, now choose four numbers and try your luck!!!\n\n"
        user_entry = Array.new
        print "First number: "
        user_entry[0] = gets.chomp.to_i
        print "Second number: "
        user_entry[1] = gets.chomp.to_i
        print "Third number: "
        user_entry[2] = gets.chomp.to_i
        print "Fourth number: "
        user_entry[3] = gets.chomp.to_i

        sort_display = Array.new
        sort_display[0] = SecureRandom.random_number(9)
        sort_display[1] = SecureRandom.random_number(9)
        sort_display[2] = SecureRandom.random_number(9)
        sort_display[3] = SecureRandom.random_number(9)

        puts "Let's see if you got me..."

        verify1 = user_entry[0] == sort_display[0]
        verify2 = user_entry[1] == sort_display[1]
        verify3 = user_entry[2] == sort_display[2]
        verify4 = user_entry[3] == sort_display[3]

        result = verify1.eql?(true) && verify2.eql?(true) && verify3.eql?(true) && verify4.eql?(true)
        if result == true
            puts "My number is: |#{sort_display[0]}|#{sort_display[1]}|#{sort_display[2]}|#{sort_display[3]}|"
            puts "Congratulations!!!! You got me"
        else
            puts "My number is: |#{sort_display[0]}|#{sort_display[1]}|#{sort_display[2]}|#{sort_display[3]}|"
            puts "You lost, do your best next time.\n\n"
        end
        
        print "Do you want to try again? y/n "
        answer = gets.chomp.to_s

        if answer == "n" || answer == "no" || answer == "No" || answer == "NO"
            return if answer == "n" || answer == "no" || answer == "No" || answer == "NO"
        elsif answer == "y" || answer == "yes" || answer == "Yes" || answer == "YES"
            self.game_init(player_name)
        else
            puts "Wrong entry"
        end
    end
end

lottery_game = LotteryGame.new

print "Enter your name: "
name = gets.chomp.to_s
lottery_game.game_init(name)
