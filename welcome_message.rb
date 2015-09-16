require_relative 'demola_mastermind_project'
require 'colorize'
class WelcomeMessage
  def introduction_message
      puts "Welcome to MASTERMIND!\n
  Would you like to " + "(p)lay".blue + ", read the" + " (i)nstructions".cyan + ", read a little" + " (b)ackground".yellow + " on
   Mastermind or " + " (q)uit?".red
   WelcomeMessage.start_message
 end
 def self.start_message
   introductory = gets.chomp
   case introductory
   when "p"
   puts "To start the game select a level you would like to play:\n
Enter (1) for Beginner,
Enter (2) for Intermediate,
Enter (3) for Advanced."
    @level = gets.chomp
    if @level == "1"
      puts "So you would like to play the game!,\n start by telling me your name\n"
        name = gets.chomp
        name_convert = name.upcase
        puts "#{name_convert} ".green + ", I have generated a beginner sequence with four elements made up of:\n"
puts "(y)ellow, ".yellow + " (c)yan, ".cyan + " (b)lue,".blue + " and " + " (r)ed,".red + " You are to guess the sequence in which the
colors appeared e.g YCOR for " + "(y)ellow, ".yellow + " (c)yan,".cyan + " (b)lue,".blue + " (r)ed,".red + " You have 10 guesses to get these colors or you lose the game.
Ready to " + " play?".blue + "\n" + " Enter your Four Color guesses:"
    GameEngine.new.play_calc_exact_partial @level
elsif @level == "2"
  puts "So you would like to play the game!,\n start by telling me your name\n"
    name = gets.chomp
    name_convert = name.upcase
  puts "#{name_convert} ".green + ", I have generated an Intermediate sequence with four elements made up of:\n"
puts "(y)ellow, ".yellow + "(c)yan, ".cyan + "(b)lue, ".blue + "(g)reen ".green + " and " + " (r)ed,".red + " You are to guess the sequence in which these colors appeared e.g YCBGR for " + " (y)ellow, ".yellow + " (c)yan, ".cyan + " (b)lue, ".blue + " (g)reen ".green + " (r)ed, ".red + " You have 10 guesses to get these colors or you lose the game. Ready to play?\n Enter your five Color guesses:"
    GameEngine.new.play_calc_exact_partial @level
elsif @level == "3"
  puts "So you would like to play the game!,\n start by telling me your name\n"
    name = gets.chomp
    name_convert = name.upcase
    puts "#{name_convert}".green + ", I have generated an Advanced sequence with four elements made up of:\n"
puts "(y)ellow,".yellow + "(c)yan,".cyan + "(b)lue,".blue + "(g)reen ".green + "(w)hite ".white + " and " + "(r)ed,".red + " You are to guess the sequence in which these colors appeared e.g YCBGWR for " + " (y)ellow, ".yellow + " (c)yan,".cyan + " (b)lue, ".blue + " (g)reen ".green + "(w)hite ".white + "(r)ed, ".red + " You have 10 guesses to get these colors or you lose the game.
Ready to play?\n Enter your six Color guesses:"
      GameEngine.new.play_calc_exact_partial @level
else
  puts "You have entered an invalid input"
end
   when "i" then puts "Enter a sequence of 4, 5 or 6 colors depending on the difficulty respectively containing the generated colors e.g YCBR for beginner or YCBGR for intermidiate or YCBGWR for advance.".cyan
WelcomeMessage.new.introduction_message
when "b" then puts "Just a little background on MASTERMIND Mastermind is a board game with an
interesting history (or rather a legend?). Some game books report that it was in
vented in 1971 by Mordecai Meirowitz, an Israeli postmaster and telecommunicatio
ns expert. After many rejections by leading toy companies, the rights were obtai
ned by a small British firm, Invicta Plastics Ltd. The firm originally manufactu
red the game itself, though it has since licensed its manufacture to Hasbro in m
ost of the world. However, Mastermind is just a clever readaptation of an old si
milar game called 'Bulls and cows' in English, and 'Numerello' in Italian... Act
ually, the old British game 'Bulls and cows' was somewhat different from the com
mercial version. It was played on paper, not on a board... Over 50 million copie
s later, Mastermind is still marketed today!".yellow
WelcomeMessage.new.introduction_message
  when "q" then puts "Thank you for playing Mastermind\n Good byebye".blue
    system('exit')
end
  end
end
WelcomeMessage.new.introduction_message
