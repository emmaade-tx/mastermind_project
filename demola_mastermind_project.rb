require_relative 'welcome_message'
require 'colorize'
class Computer #the computer class has 3 methods which generate 3 different codes for each level

#this method generates 4 random codes
  def self.code_beginner
    colors = ['y', 'c', 'b', 'r']
    generated_code = []
    4.times{ generated_code << colors[rand(4)] }
    generated_code
  end
  #this method generates 5 random codes
  def self.code_intermediate
    colors = ['y', 'c', 'b', 'g', 'r']
    generated_code = []
    5.times{ generated_code << colors[rand(5)] }
    generated_code
  end
  #this method generates 6 random codes
  def self.code_advance
    colors = ['y', 'c', 'b', 'g', 'w', 'r']
    generated_code = []
    6.times{ generated_code << colors[rand(6)] }
    generated_code
  end
end

class Difficulty #the difficulty class collect the codes generated from each level and also read the level picked by the user

  def self.code_level level
    if level == "1"
    generated_code = Computer.code_beginner

  elsif level == "2"
    generated_code = Computer.code_intermediate
  else
    generated_code = Computer.code_advance
  end
end
end

class GameEngine #this is the engine of the game as the name implies, it gets the partial and exact match by comparing the the generated code with the user's guess code
  def play_calc_exact_partial level
        start_time=Time.now # this line of code records the starting time
        generated_code = Difficulty.code_level level  #this line of code gets the computer generated code for any the level as picked by the user
        p generated_code
          10.times do |i| # this loop is to record the number of times the user can guess at each time, the partial and exact calculation are ongoing within the loop

          guess_one = (gets.chomp).split('') #this line of code gets the user's guess and convert it into an array
            exact_match = 0 #counter for exact match
            partial_match = 0 #counter for partial match
            check = generated_code.zip(guess_one) #this line of code combine merges the computer generated code and the guess code and the output is saved into a check variable
              check.each do |i| #loop through the check variable to get the elements
              if i[0] == i[1]
                  exact_match += 1 #elements that has the same first index and second index are considered to be exact
              else
                  if generated_code.include?i[1] #this line od code of check the check variable and gets the second index that is only present in the generated code, those are the partial
                      partial_match += 1
                  end
              end
          end

    if exact_match == generated_code.length # at a point where we have the same length of computer generated code and exact match, game ends and the user won the game
             end_time=Time.now #time stops
             puts "CONGRATULATION! ".blue + " You guessed the sequence " + " #{generated_code} ".red + " in" + " #{end_time-start_time}".cyan

             puts "Do you want to " + " (p)lay again " + " or" + " (q)uit?".red
             feedback_one = gets.chomp
             if feedback_one == "p"
               WelcomeMessage.new.introduction_message
             else
              system(exit)
             end
break # at the point where the exact match equals the computer code length, the loop breaks, if not the loops continues
else
    puts "#{guess_one} ".cyan + " has " + "#{partial_match} ".red + " partial match with " + "#{exact_match} ".blue + "
    exact match in the correct positions. You have taken " + "#{i+1}".cyan

        end
    end
    #Here, the loops is completed, the user has reached the number of time, so he lost the game
    puts "You lost badly, " + "SORRY!".red + " Do you want to " + " Try again?".cyan + " Enter " + " (y)".blue + " for" + " Yes".blue + " or any key for " + "No\n".red
    feedback = gets.chomp
    if feedback == "y"
      WelcomeMessage.new.introduction_message
   else
     system(exit) #this code breaks the whole of my code and leaves the entire game
   end
end
end

# Working on having a multiplayer where they can pass a turn..... still in progress
class Player_one
  def guess_code_one
    puts "What is your guess?"
    guess_one = gets.chomp
    return GameProcess.play_one
  end
end


class Player_two
  def guess_code_one
    puts "What is your guess?"
    guess_two = gets.chomp
    return GameProcess.play_two
  end
end
