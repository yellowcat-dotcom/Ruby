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

  def on_view_created
    @student_list=StudentList.new(StudentListDBAdapter.new)
  end

  def show_view
    @view.create.show
  end

  def refresh_data(k, n)
    @data_list = @student_list.get_k_n_student_short_list(k, n, @data_list)
    @view.update_student_count(@student_list.count_student)
  end
end