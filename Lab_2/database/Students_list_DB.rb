require_relative 'DBUniversity'
require 'json'
class StudentListDB

  def initialize
    self.client = DBUniversity.instance
  end

  #last_name, first_name, paternal_name, phone, telegram, email, git
  def into_hash(arr)
    attrs = {}
    i=0
    %i[id last_name first_name paternal_name phone telegram email git].each do |attr|
      attrs[attr] = arr[i] unless arr[i].nil?
      i=i+1
    end
    attrs
  end
  def student_by_id(id_student)
    hash = client.prepare_exec('SELECT * FROM students WHERE id = ?', id_student).first
    hash=into_hash(hash)
    return nil if hash.nil?

    Student.new(**hash)
  end

  def get_k_n_student_short_list(k,n)
    students = client.prepare('SELECT * FROM students LIMIT ? OFFSET ?').execute((k-1)*n,n)
    slice = students.map { |h| StudentShort.new(Student.from_hash(h)) }

    DataListStudentShort.new(slice)
  end

  def add_student(student)
    st = client.prepare_exec('insert into students (last_name, first_name, paternal_name, phone,
                          telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)',*student_attr(student))
  end

  def replace_student(id_student, student)
    st ='UPDATE students SET last_name=?, first_name=?, paternal_name=?, phone=?, telegram=?, email=?, git=? WHERE id=?'
    client.prepare_exec(st,*student_attr(student), id_student)
  end

  def delete_student(id_student)
    client.prepare_exec('DELETE FROM students WHERE id = ?', id_student)
  end

  def count_student
    client.query('SELECT COUNT(id) FROM students').next[0]
  end

  private

  attr_accessor :client

  def student_attr(student)
    [student.last_name, student.first_name, student.paternal_name,
     student.phone, student.telegram,
     student.email, student.git]
  end

end

