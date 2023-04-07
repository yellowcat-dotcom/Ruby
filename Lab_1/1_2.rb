user=ARGV[0] 
puts "Привет, #{user}" 
puts"#{user},какой язык у тебя любимый?" 
lan=STDIN.gets.chomp 
case lan 
    when"ruby" 
        puts"Ты подлиза" 
    when"C++" 
        puts"ну ок" 
    else  
		puts "Скоро будет ruby"
end
