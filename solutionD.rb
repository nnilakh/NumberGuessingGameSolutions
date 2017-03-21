#---------
# name: NumberGuess.rb
#
#----------------

class Screen

 def cls
   puts ("\n" * 30)
   puts "\a"
 end

 def pause
    STDIN.gets
 end

end

class Game
    def display_greeting
        Console_Screen.cls
        print "\t\t Welcome to the Ruby Number Guessing Game!" +
        "\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " + 
        "continue."

        Console_Screen.pause
    end

    def display_instruction
        Console_Screen.cls
        puts "Instruction:\n\n"

        puts "This game randomly generates a number from 1 to 1000 and "
        puts "challaenges you to identify it in as few guesses and possible "
    end

    def generate_number
        return randomNo = 1 + rand(1000)
    end

    def play_game
        number = generate_number
    numberOfGuesses=0 #Added counter for number of guesses 

        loop do
            Console_Screen.cls
            print "\nEnter your guess and press the enter key: "

            reply = STDIN.gets
            reply.chop!

            if reply=="cheat"
                puts "The random number is #{number}"
                next
            end
            reply = reply.to_i

            if reply < 1 or reply > 1000 then
                puts "Invalid Guess. Please guess a number from 1 to 1000"
                redo # redo the ciurrent iteration of the loop
            end
          numberOfGuesses+=1 #Increment counter on each step
            if reply == number then
                Console_Screen.cls
                print "You have guessed the number! Press Enter to continue."
                Console_Screen.pause
                break
            elsif reply < number then
                Console_Screen.cls
                print "Your guess is too low! Press enter to continue."
                Console_Screen.pause
            elsif reply > number then
                Console_Screen.cls
                print "Your guess is too high! Press enter to continue."
                Console_Screen.pause
            end
            if numberOfGuesses==10
                puts "You used up all your 10 attemps! You lose!"
                break
            end

        end
        numberOfGuesses     
    end

    def display_credits
        Console_Screen.cls
        puts "\t\t\Thanks you for playing the number game!!"
    end

$noRight = 0

    Console_Screen = Screen.new

    SQ = Game.new

    SQ.display_greeting

    answer = ""

  numberOfGuessesPerGame=[] #Array having record of number of guesses per game

    loop do
        Console_Screen.cls

        print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

        answer = STDIN.gets

        answer.chop!

        break if answer == "y" || answer == "n"
    end

    if answer == "n"

        Console_Screen.cls

        puts "Perhaps anoher time.\n\n"

    else
        SQ.display_instruction
        loop do
      numberOfGuessesPerGame << SQ.play_game #Update the array with the number of guesses for every game
            Console_Screen.cls
            puts "You have played #{numberOfGuessesPerGame.length} times, with average number of guesses per game being #{numberOfGuessesPerGame.reduce(:+) / numberOfGuessesPerGame.length.to_f}"
            print "Would you like to play again? (y/n): "
            #Print the statistics at end of every game
            playAgain = STDIN.gets
            playAgain.chop!

            break if playAgain == "n"
        end

        SQ.display_credits

    end

end


