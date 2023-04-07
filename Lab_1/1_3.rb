puts"#{user},введи команду языка ruby"
rubycomand=STDIN.gets.chomp
puts"#{user},введи команду ОС"
occomand=STDIN.gets.chomp
system "ruby -e \"#{rubycomand}\"" #команда языка, хранящаяся в строке
system occomand  #команда в ОС

#метод класса не привязан к объекту, а применяется ко всем объектам класса  визуально это словно функция с объектами
#метод объекта применяется к конкретному объекту

#5 методов объекта класса строка 
#string.new(str="hello")
#str * integer новая строка из integer копий
#string.length
#string.size
#string.revers
#string.bytesize