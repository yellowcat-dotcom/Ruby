require_relative 'window'
require_relative 'logicFromWindow'
require_relative 'studentList'
require_relative 'Students_list_DB'
require_relative '../data/data_list_student_short'
require_relative 'studentFileAdapter'
require_relative 'StudentList'
require_relative '../strategy/students_list_json'
require_relative 'student_create_form_controller'
require_relative 'student_edit_form_controller'

#require 'win32api'
require 'glimmer-dsl-libui'


class StudentListController
  attr_reader :view
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  # Метод инициализирует экземпляр класса StudentList с помощью StudentListDBAdapter.
  def on_view_created
    #@student_list = StudentList.new(StudentFileAdapter.new(StudentListJson.new, './Lab_2/students.json'))
    @student_list=StudentList.new(StudentListDBAdapter.new)

  end

  # Отображает представление view.
  def show_view
    @view.create.show
  end
  def show_add_student()
    controller = StudentCreateFormController.new(self)
    view = StudentCreateForm.new(controller)
    controller.view=view
    view.create.show
  end

  def show_edit_student(current_page, per_page, selected_row)
    student_num = (current_page - 1) * per_page + selected_row
    @data_list.select_elem(student_num)
    student_id = @data_list.selected_id
    controller = StudentEditFormController.new(self, student_id)
    view = StudentCreateForm.new(controller)
    controller.view=view
    view.create.show
  end

  def delete_selected(current_page, per_page, selected_row)
    #begin
    #student_num = (current_page - 1) * per_page + selected_row
    student_num = selected_row
    puts student_num
    @data_list.select_elem(student_num)
    student_id = @data_list.selected_id
    @student_list.delete_student(student_id)
    #rescue
    #on_db_conn_error
    #end
  end

  # Oбновляет данные списка студентов.
  # Получает короткий список из БД с помощью get_k_n_student_short_list.
  # Обновляет экземпляр @data_list новым списком.
  # Обновляет счетчик студентов на представлении @view с помощью метода update_student_count.
  def refresh_data(k, n)
    #Сформировать список исключительных ситуаций, который может возникнуть при выполнении включения программ
    #begin
    #raise StandardError, "Error DB"
    @data_list = @student_list.get_k_n_student_short_list(k, n, @data_list)
    @view.update_student_count(@student_list.count_student)
    # rescue
    #    on_db_conn_error
    # end
  end

  def on_db_conn_error
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    exit(false)
  end


end