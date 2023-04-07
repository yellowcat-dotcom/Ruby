#ПРоверка элемента по индексу: это глобальный минимум. true or false
def glob_min?(list, index)
  raise ArgumentError.new("Incorrect value!") if index==nil 
  list.each_with_index.min[1] ==index    
end

#метод возвращает новый списов, в котором min и max поменяны местами
def min_max_reverse(list)
  max=list.each_with_index.max[0]
  index_max=list.each_with_index.max[1]
  min=list.each_with_index.min[0]
  index_min=list.each_with_index.min[1]
  list[index_min]=max
  list[index_max]=min
  return(list)
end

#Находится ли максимальный элемент в указанном интервале true or false
def max_in_interval?(list, a, b)
  list.each_with_index.max[1].between?(a,b)     
end

#Возвращает среднее арифметическое модулей листа
def sred_arifmetich_abs(list)
  list_abs=list.map{|x| 
    if x<0 then 
      x=x*(-1)
    else x
    end}
  return(list_abs.sum/list.length)
end

#возвращает новый лист с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение.
def new_massif(list)
  sr_ar=list.sum/list.length
  max_el=list.max 
  return(list.select{|x|
    if x>sr_ar && x<max_el then 
      x
    end})
end

file_name = ARGV[0]
array = File.open(file_name) {|file| file.readlines.map(&:to_i)}

puts 'Выберите:'
puts '1. Необходимо определить является ли элемент по указанному индексу глобальным минимумом (ВВЕСТИ ИНДЕКС)
2. Необходимо поменять местами минимальный и максимальный элементы массива.
3. Необходимо проверить наличие максимального элемента массива в интервале. (ВВЕСТИ ИНТЕРВАЛ)
4. Найти среднее арифметическое модулей массива
5. Построить новый массив с элементами, большими, чем среднее арифметическое списка, но меньшими, чем его максимальное значение.'

method_num = STDIN.gets.chomp.to_i


case method_num
  when 1
    puts 'Введите индекс проверяемого элемента:'
    print"index="
    index_el=STDIN.gets.chomp.to_i
    if index_el > array.length then
      puts "Неверный индекс, введите индекс меньше #{array.length}"
    else
      if glob_min(array, index_el-1) then
        print("Элемент по указанному индексу является глобальным минимумом")
      else 
        print("Элемент по указанному индексу не является глобальным минимумом")
      end  
    end

  when 2
    print(min_max_reverse(array))

  when 3
    puts 'Введите границы интервала:'
    print"a="
    a=STDIN.gets.chomp.to_i
    print"b="
    b=STDIN.gets.chomp.to_i
    if a>b then 
      puts 'Введен неправельный интервал'
    end
    if b>array.length then
      puts'неверный интервал'
    else 
      if max_in_interval(array,a,b) then
        print("Максимальный элемент находится в данном интервале")
      else 
        print("Максимальный элемент не находится в данном интервале")
      end
    end

  when 4
    print(sred_arifmetich_abs(array))

  when 5
    print(new_massif(array))

  else 
    puts 'Команды с таким номером нет'
end