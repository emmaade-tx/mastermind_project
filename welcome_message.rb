require_relative 'demola_mastermind_project'
class WelcomeMessage
  def introduction_message
      puts "Welcome to MASTERMIND!\n
  Would you like to (p)lay, read the (i)nstructions, read a little (b)ackground on
   Mastermind or (q)uit?"
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
        puts "#{name}, I have generated a beginner sequence with four elements made up of:
(y)ellow.yellow, (c)yan.cyan, (o)range.orange and (r)ed.red You are to guess the sequence in which the
se colors appeared e.g YCOR for (y)ellow, (c)yan, (o)range and (r)ed. You have 10 guesses to get these colors or you lose the game.
Ready to play?\n Enter your Four Color guesses:"
    GameEngine.new.play_calc_exact_partial
elsif @level == "2"
  puts "So you would like to play the game!,\n start by telling me your name\n"
    name = gets.chomp
    puts "#{name}, I have generated an Intermediate sequence with five elements made up of:
(y)ellow, (c)yan, (o)range, (r)ed,(v)iolet . You are to guess the sequence in which the
se colors appeared e.g YCORV for (y)ellow, (c)yan, (o)range and (r)ed, (v)iolet. You have 10 guesses to get these colors or you lose the game.
Ready to play?"
    GameEngine.new.play_calc_exact_partial
elsif @level == "3"
  puts "So you would like to play the game!,\n start by telling me your name\n"
    name = gets.chomp
    puts "#{name}, I have generated an advanced sequence with six elements made up of:
(y)ellow, (c)yan, (o)range, (r)ed,(v)iolet, (p)urple . You are to guess the sequence in which the
se colors appeared e.g YCORVP for (y)ellow, (c)yan, (o)range and (r)ed, (P)urple, (i)ndigo. You have 10 guesses to get these colors or you lose the game.
Ready to play?\n Enter your Four Color guesses:"
      GameEngine.new.play_calc_exact_partial
else
  puts "You have entered an invalid input"
end
   when "i" then puts "Enter a sequence of 4 colors containing the generated colors e.g RYBG or YGRB.
If you enter fewer than 4 or more than 4 colors, you would receive an error message"
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
s later, Mastermind is still marketed today!\n Enter your Four Color guesses:"
WelcomeMessage.new.introduction_message
  when "q" then puts "Thank you for playing Mastermind\n Good byebye"
    system('exit')
end
  end
end
WelcomeMessage.new.introduction_message
