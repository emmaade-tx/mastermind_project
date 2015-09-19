require_relative 'welcome_message'
require 'colorize'
require 'json'
require 'pry'
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
  def play_calc_exact_partial level, name_convert

        start_time=Time.now # this line of code records the starting time
        generated_code = Difficulty.code_level level  #this line of code gets the computer generated code for any the level as picked by the user

          10.times do |i| # this loop is to record the number of times the user can guess at each time, the partial and exact calculation are ongoing within the loop

          guess_one = (gets.chomp).split('') #this line of code gets the user's guess and convert it into an array
          if guess_one == "ch".split('')
            p generated_code
          end

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
             @finished_time = end_time-start_time
             puts "CONGRATULATION, #{name_convert}! ".blue + " You guessed the sequence " + " #{generated_code} ".red + " in" + " #{@finished_time}".cyan

             TopScore.topscore_file name_convert, @finished_time

             break # at the point where the exact match equals the computer code length, the loop breaks, if not the loops continues
    else
    puts "#{guess_one} ".cyan + " has " + "#{partial_match} ".magenta + " partial match with " + "#{exact_match} ".blue + "
    exact match in the correct positions. You have taken " + "#{i+1}".cyan + " attempt or guess(s)"

        end
    end
    #Here, the loops is completed, the user has reached the number of time, so he lost the game
    puts "You lost badly, " + "SORRY!".red + " Do you want to " + " Try again?".cyan + " Enter " + " (y)".blue + " for" + " Yes".blue + " or any key for " + "No\n".red
    feedback = gets.chomp
    if feedback == "y"
      WelcomeMessage.new.introduction_message
   else
       puts "Thank you for playing Mastermind\n Good byebye".blue
     system(exit) #this code breaks the whole of my code and leaves the entire game
   end
end
end
class TopScore #this class have only one method, contains IO file that reads the name and time of the player to be able to set top ten
    def self.topscore_file name_convert, finished_time  #collect the name and finished time from the user

        file = File.read("score.json")  #this IO file read from json file score.json
        score = JSON.parse(file)   #the line of code convert the json file into hash
        len = score["scores"].length

        record = Hash.new # create a new hash
        record["name"] = name_convert # save the name of the user in a key
        record["time"] = finished_time # save the finished time in the a key
        score["scores"][len] = record # put the the new generated elements in the new hash

        name_score = score.to_json # converted back to json

            #saving the converted json file into its proper place by writing in it
        file = File.new("score.json", 'w')
        file.write(name_score)
        file.close

        file = File.read("score.json") # reading the new file
        top_score = JSON.parse(file) #converting into hash for usage

        top_scores = top_score["scores"].sort_by {|x| x["time"]} #iterating through the hash and sorting it with time
          puts "Do you want to view the top score? type" + " y".blue + " for yes," + " N".magenta + " for no and" + " q".red + " to quit the game"
          reply = gets.chomp
          if reply == "y"
          #binding.pry
          puts "========================="
          puts "******TOP SCORES******"
          puts "========================="
          top_scores.each do |x| #iterating through the hash to get the the element in order to print the username and finished time
            #binding.pry
            puts "______________________________________________________________"
            puts "#{x["name"]}              #{x["time"]}secs"
          end
          puts "______________________________________________________________"
            puts "You have just seen the top score, do you want to play again or quit the game? Type" + " p".blue + " to play again and" + " q".red + " to quit"
            final_reply = gets.chomp
            if final_reply == "p"
            WelcomeMessage.new.introduction_message
          else
            puts "Thank you for playing Mastermind\n Good byebye".blue
            system(exit)
          end

        elsif reply == "n"
        WelcomeMessage.new.introduction_message
      else
        puts "Thank you for playing Mastermind\n Good byebye".blue
        system(exit)

        end

    end
  end
# Working on having a multiplayer where they can pass a turn..... still in progress
class MultiPlayer
  def game_engine_multiplayer level, name_convert_one, name_convert_two
    start_time=Time.now # this line of code records the starting time
    generated_code = Difficulty.code_level level  #this line of code gets the computer generated code for any the level as picked by the user

      10.times do |i| # this loop is to record the number of times the user can guess at each time, the partial and exact calculation are ongoing within the loop

        puts "#{name_convert_one} ".green + ", input your four guesses "
      guess_one = (gets.chomp).split('') #this line of code gets the user's guess and convert it into an array
      if guess_one == "ch".split('')
        p generated_code
      end
        exact_match_one = 0 #counter for exact match
        partial_match_one = 0 #counter for partial match
        check = generated_code.zip(guess_one) #this line of code combine merges the computer generated code and the guess code and the output is saved into a check variable
          check.each do |i| #loop through the check variable to get the elements
          if i[0] == i[1]
              exact_match_one += 1 #elements that has the same first index and second index are considered to be exact
          else
              if generated_code.include?i[1] #this line od code of check the check variable and gets the second index that is only present in the generated code, those are the partial
                  partial_match_one += 1
              end
          end
      end

if exact_match_one == generated_code.length # at a point where we have the same length of computer generated code and exact match, game ends and the user won the game
         end_time=Time.now #time stops
         @finished_time = end_time-start_time
         puts "CONGRATULATION, #{name_convert_one}! ".blue + " You guessed the sequence " + " #{generated_code} ".red + " in" + " #{@finished_time}".cyan + "You won the game"

         TopScore.topscore_file name_convert_one, @finished_time

         break # at the point where the exact match equals the computer code length, the loop breaks, if not the loops continues
else
puts "#{name_convert_one} ".blue + ": #{guess_one} ".cyan + " has " + "#{partial_match_one} ".magenta + " partial match with " + "#{exact_match_one} ".blue + "
exact match in the correct positions. You have taken " + "#{i+1}".cyan + " attempt or guess(s)"

    end

    start_time=Time.now # this line of code records the starting time
    #this line of code gets the computer generated code for any the level as picked by the user

        puts "#{name_convert_two} ".green + ", input your four guesses "
      guess_two = (gets.chomp).split('') #this line of code gets the user's guess and convert it into an array
      if guess_two == "ch".split('')
        p generated_code
      end
        exact_match_two = 0 #counter for exact match
        partial_match_two = 0 #counter for partial match
        check = generated_code.zip(guess_two) #this line of code combine merges the computer generated code and the guess code and the output is saved into a check variable
          check.each do |i| #loop through the check variable to get the elements
          if i[0] == i[1]
              exact_match_two += 1 #elements that has the same first index and second index are considered to be exact
          else
              if generated_code.include?i[1] #this line od code of check the check variable and gets the second index that is only present in the generated code, those are the partial
                  partial_match_two += 1
              end
          end
      end

if exact_match_two == generated_code.length # at a point where we have the same length of computer generated code and exact match, game ends and the user won the game
         end_time=Time.now #time stops
         @finished_time = end_time-start_time
         puts "CONGRATULATION, #{name_convert_two}! ".blue + " You guessed the sequence " + " #{generated_code} ".red + " in" + " #{@finished_time}".cyan + "You won the game"

         TopScore.topscore_file name_convert_two, @finished_time

         break # at the point where the exact match equals the computer code length, the loop breaks, if not the loops continues
else
puts "#{guess_two} ".cyan + " has " + "#{partial_match_two} ".magenta + " partial match with " + "#{exact_match_two} ".blue + "
exact match in the correct positions. You have taken " + "#{i+1}".cyan + " attempt or guess(s)"

    end

end
#Here, the loops is completed, the user has reached the number of time, so he lost the game
puts "Both of you lost badly, " + "SORRY!".red + " Do you want to " + " Try again?".cyan + " Enter " + " (y)".blue + " for" + " Yes".blue + " or any key for " + "No\n".red
feedback = gets.chomp
if feedback == "y"
  WelcomeMessage.new.introduction_message
else
   puts "Thank you for playing Mastermind MultiPlayer\n Good byebye".blue
 system(exit) #this code breaks the whole of my code and leaves the entire game
end
end
end
