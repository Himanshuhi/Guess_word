class Himanshu
    def initialize(word)
      @word = word.downcase
      @guesses = []
      @wrong_guesses = []
    end
  
    def play
      puts "Welcome to Himzo game!"
      puts "You will now have to answer 5 questions on programming languages."
      puts "Each question will have a hint in the format '- _ - ...'"
      puts "Guess a letter to fill in the blanks, or guess the whole word."
      score = 0
      5.times do |i|
        question = questions[i]
        answer = answers[i]
        puts "\nQuestion #{i + 1}: #{question}"
        hint = "- " * answer.length
        until hint.gsub(/ /, '') == answer || wrong_guesses.length >= 6
          puts "Hint: #{hint}"
          print "Guess a letter or the word: "
          guess = gets.chomp.downcase
          if guess.length == 1
            if answer.include?(guess)
              puts "Correct!"
              answer.chars.each_with_index do |char, index|
                hint[index * 2] = char if char == guess
              end
            else
              puts "Wrong!"
              wrong_guesses << guess
            end
          elsif guess == answer
            puts "Correct!"
            hint = guess
          else
            puts "Wrong!"
            wrong_guesses << guess
          end
        end
        if hint.gsub(/ /, '') == answer
          puts "You answered the question correctly!"
          score += 1
        else
          puts "You ran out of guesses! The answer was '#{answer}'."
        end
        @guesses = []
        @wrong_guesses = []
      end
      puts "\nScorecard: #{score}/5"
      puts "Thanks for playing!"
    end
  
    private
  
    attr_reader :word, :guesses, :wrong_guesses
  
    def questions
      [
        "What programming language was created by Yukihiro Matsumoto in 1995?",
        "What programming language was developed by Microsoft and first released in 2000?",
        "What programming language was created by James Gosling at Sun Microsystems in 1995?",
        "What programming language is often used for web development and was first released in 1995?",
        "What programming language was created by Bjarne Stroustrup at Bell Labs in 1983?"
      ]
    end
  
    def answers
      ["ruby", "c#", "java", "javascript", "c++"]
    end
  end
  
  game = Himanshu.new("")
  game.play
  
