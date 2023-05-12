require 'sqlite3'
require_relative 'studentList'
require_relative 'studentFileAdapter'
class StudentCreateFormController
  def initialize(controller)
    @controller = controller
  end

  def on_view_created
    begin
      #raise StandardError "Test"
      @student_rep = StudentList.new(StudentListDBAdapter.new)
    rescue SQLException::SQLException => e
      on_db_conn_error(e)
    end
  end

  # def save_student(student)
  #   if @existing_student.nil?
  #     @student_rep.add_student(student)
  #   else
  #     @student_rep.replace_student(@existing_student[:id], student)
  #   end
  # end

  def view=(view)
    @view = view
  end

  def process_fields(fields)
    student = Student.new(**fields)
    @student_rep.add_student(student)
    @view.close
  end

  def on_db_conn_error(e)
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    exit(false)
  end
end