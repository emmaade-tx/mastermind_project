class Computer
   @generated_code = @generated_code

  def code_beginner
    colors = ['B', 'G', 'Y', 'R']
    colors_rand = Random.new
    @generated_code = []
    4.times{ @generated_code << colors[rand(4)] }
    @generated_code
  end
end

class GameEngine
  def play_calc_exact_partial
        start_time=Time.now
          10.times do |i|
          guess_one = (gets.chomp).split('')
            @generated_code
            counter = 0
            counter_partial = 0
            check = @generated_code.zip(guess_one)
              check.each do |i|
              if i[0] == i[1]
                  counter += 1
              else
                  if @generated_code.include?i[1]
                      counter_partial += 1
                  end
              end
          end

    if counter == @generated_code.length
             end_time=Time.now
             puts "Congratulations! You guessed the sequence #{@generated_code} in #{end_time-start_time}\n
Do you want to (p)lay again or (q)uit?"
break
else
    puts "#{guess_one} has #{counter_partial} with #{counter} in the correct positions. You have taken #{i+1}"
        end
    end
end
end

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
a = Computer.new
b = GameEngine.new
a.code_beginner
b.code_beginner
a.play_calc_exact_partial
b.play_calc_exact_partial
