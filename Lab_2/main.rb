require_relative 'student/student'
require_relative 'student/student_short'
require_relative 'data/data_table'
require_relative 'data/data_list_student_short'
require_relative 'strategy/student_list_base'
require_relative 'strategy/student_list_strategy'
require_relative 'strategy/students_list_txt'
require_relative 'strategy/students_list_json'
require_relative 'strategy/students_list_yaml'
require_relative 'database/Students_list_DB'
require_relative 'database/window'
require 'json'
require 'sqlite3'

def read_from_txt(file_path)
  if !File.exist?(file_path)
    raise ArgumentError "This file '#{file_path}' not found"
  else
    student_list= Array.new
    file = File.new(file_path, "r:UTF-8")
    lines = file.read.to_s.strip
    string_student=""
    lines.each_char do |ch|
      string_student+= ch
      if ch=='}'
        student_list.append(Student.pars_str(string_student))
        string_student= ""
      end
    end
    file.close
  end
  student_list
end

def write_to_txt(file_path, student_list)
  if !File.exist?(file_path)
    raise ArgumentError "This file '#{file_path}' not found"
  else
    result = ''
    student_list.each do |student|
      result +=student.to_json+ "\n"
    end
    File.write(file_path, result)
  end
end
#(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
student1 = Student.new(last_name:'Фамилин', first_name:'Имя', paternal_name:'Отчествов', id:1)
student2 = Student.new(last_name:'Гончаренко', first_name:'Валентина', paternal_name:'Викторовна', id:2, git:'@yellowcat-dotcom', telegram:'@yellowcatdotcom',email:'valentinagoncarenko975@gmail.com')
student3 = Student.new(last_name:'Минаков',first_name:'Владислав',paternal_name:'Андреевич',phone:'8(918)-686-00-19', id:2, email:"valdos777m@gmail.com", git:'@yellowcat-dotcom', telegram:'@yellowcatdotcom')


# db = StudentListDB.new
# puts db.student_by_id(2)
# puts db.count_student
# db.add_student(student1)
# puts db.count_student
# db.replace_student(6,student2)
# puts db.student_by_id(6)

main_window = Window.new.create
main_window.show





# db = SQLite3::Database.open './identifier.sqlite'
# sel = db.prepare "Select * from students"
# result = sel.execute
# result.each {|th| puts th.join "\s"}
#
#
# puts 'Тест(JSON->YAML):'
# stud_list_json = StudentListBase.new(StudentListJson.new)
# stud_list_json.add_student(student1)
# stud_list_json.add_student(student2)
# stud_list_json.add_student(student3)
# stud_list_json.save_to_file('students_save.json')
# stud_list_json.load_from_file('students_save.json')
# stud_list_json.data_type = StudentListYaml.new
# stud_list_json.save_to_file('students_save.yaml')
#
#
# puts 'Тест(YAML->JSON):'
# stud_list_yaml = StudentListBase.new(StudentListYaml.new)
# stud_list_yaml.add_student(student1)
# stud_list_yaml.add_student(student2)
# stud_list_yaml.save_to_file('students_save.yaml')
# stud_list_yaml.load_from_file('students_save.yaml')
# stud_list_yaml.data_type = StudentListJson.new
# stud_list_yaml.save_to_file('students_save.json')
# puts stud_list_yaml





# stud_list_json.load_from_file('students_save.yaml')
# stud_list_json.save_to_file('students_save.json')


# stud_list_yaml = StudentListBase.new(StudentListYaml.new)
# stud_list_yaml.add_student(student1)
# stud_list_yaml.add_student(student2)
# stud_list_yaml.save_to_file('students_save.yaml')
# stud_list_yaml.load_from_file('students_save.yaml')

# stud_list_json = StudentListBase.new(StudentListJson.new)

# puts
# puts 'Тест (YAML):'
#stud_list_yaml = StudentListBase.new(StudentListYaml.new)
# stud_list_yaml.add_student(student1)
# stud_list_yaml.add_student(student2)
#
#  stud_list_yaml.save_to_file('students_save.yaml')
# stud_list_yaml.load_from_file('students_save.yaml')
# puts stud_list_yaml.student_count
#
# puts
# puts 'Тест (TXT):'
# stud_list_txt = StudentListBase.new(StudentListTxt.new)
# stud_list_txt.add_student(student1)
# stud_list_txt.add_student(student2)
# stud_list_txt.add_student(student3)
# stud_list_txt.save_to_file('students_save.txt')
# stud_list_txt.load_from_file('students_save.txt')
# puts stud_list_txt.student_count

# Student.valid_email?(student_3.email)

# puts student_3.id

# table_1=Data_table.new([[1,2,"12"],[1,2,3], [1,2,3,4,5]])
# puts table_1.stolb_count


# student_list= read_from_txt('students.txt')
#
# puts student_list
#
# write_to_txt('student_out.txt', student_list)
# puts student_list[0].getContact
# puts student_list[0].shortName
# puts st_test = StudentShort.new(student_list[0])

# puts "проверка парсинга строки"
# puts Student.pars_str('{"last_name":"Гончаренко", "first_name":"Валентина", "paternal_name":"Викторовна",
# "id":2, "git":"@yellowcat-dotcom", "telegram":"@yellowcatdotcom","email":"valentinagoncarenko975@gmail.com"}')
# puts


# puts "StudentShort"
# puts st_test = StudentShort.new(student_3)


# puts
# puts "StudennnnnnnnntShort from string"
# puts StudentShort.from_str(5, '{"last_name":"Гончаренко", "first_name":"Валентина", "paternal_name":"Викторовна",
# "id":2, "git":"@yellowcat-dotcom", "telegram":"@yellowcatdotcom","email":"valentinagoncarenko975@gmail.com"}')


#puts student_3.getContact


#puts student
#puts student_2
#puts student_3