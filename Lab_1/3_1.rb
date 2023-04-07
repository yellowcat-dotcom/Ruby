#Минимальный элемент(0)
def min_elem(ar)
  return false if ar.empty?

  min= ar[0]
  for i in ar
    min=i if i< min
  end
  min
end

#Номер первого положительного элемента(1)
def number(ar)
  return false if ar.empty?
  n=0
  for i in ar
    return n if i>0
    n+=1
  end
  -1
end

#                                           ruby 3_1.rb 1 /media/sf_Public/Array.txt      ruby 3_1.rb <Номер метода> <Путь к файлу с массивом>   
methods = %i[min_elem number]
method_n = ARGV[0].to_i
file_path = ARGV[1]


file = File.open(file_path)
array = file.readline.split(' ').map(&:to_i)

puts "Массив: #{array}"
puts "Результат работы метода: #{method(methods[method_n]).call(array)}"