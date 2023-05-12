require_relative '../strategy/student_list_base'
class StudentFileAdapter
  def initialize(type_file,file_address)
    #обращаемся к экземплярам класса StudentListBase
    @file = StudentListBase.new(type_file)
    @file.load_from_file(file_address)
    @file_address = file_address
  end

  def student_by_id(id_student)
    @file.student_by_id(id_student)
  end

  def add_student(student)
    @file.add_student(student)
    @file.save_to_file(@file_address)
  end

  def delete_student(id_student)
    @file.delete_student(id_student)
    @file.save_to_file(@file_address)
  end

  def replace_student(id_student, student)
    @file.replace_student(id_student, student)
    @file.save_to_file(@file_address)
  end

  def count_student
    @file.count_student
  end

  def get_k_n_student_short_list(page,n, data_list)
    @file.get_k_n_student_short_list(page, n, data_list)
  end
end