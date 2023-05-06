require_relative 'window'
require_relative 'logicFromWindow'
require_relative 'studentList'
require_relative 'Students_list_DB'
require_relative '../data/data_list_student_short'

class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new([])
    @data_list.add_observer(@view)
  end

  # Метод инициализирует экземпляр класса StudentList с помощью StudentListDBAdapter.
  def on_view_created
    @student_list=StudentList.new(StudentListDBAdapter.new)
  end

  # Отображает представление view.
  def show_view
    @view.create.show
  end

  # Oбновляет данные списка студентов.
  # Получает короткий список из БД с помощью get_k_n_student_short_list.
  # Обновляет экземпляр @data_list новым списком.
  # Обновляет счетчик студентов на представлении @view с помощью метода update_student_count.
  def refresh_data(k, n)
    @data_list = @student_list.get_k_n_student_short_list(k, n, @data_list)
    @view.update_student_count(@student_list.count_student)
  end
end