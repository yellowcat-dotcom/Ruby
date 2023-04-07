require_relative 'student'
class DataTable
  attr_reader  :stroka_count, :stolb_count

  def initialize(table)
    self.stroka_count = table.length
     max_c=0
     table.each do |el|
       max_c = el.length if el.size > max_c
     end
    self.stolb_count = max_c
     self.table = table
  end

  def get_elem(stroka, stolb)
    return nil if stroka>=stroka_count
    return nil if stolb>=stolb_count
    table[stroka][stolb]
  end
  #attr_accessor :table
  private
  attr_accessor :table
  attr_writer :stroka_count, :stolb_count
end
