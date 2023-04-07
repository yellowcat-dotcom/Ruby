class DataList

  private_class_method :new
  attr_writer :list

  def initialize(items)
    self.list=items
    self.sel_objects = []
  end

  def select(number)
    raise ArgumentError, "argument 'number' not Integer" if number.class != Integer
    sel_objects.append(number)
  end

  def get_selected
    list_id=[]
    sel_objects.each do |i|
      list_id.append(list[i].id)
    end
    list_id
  end

  # * необходима так как, если нам передадут [1,2,3], то передастся row.push(1,2,3)
  #
  def get_data
    result = []
    number = 0
    list.each do |i|
      atributs = []
      atributs << number
      atributs.push(*table_fields(i))
      result << elem
      number += 1
    end
    DataTable.new(result)
  end

  protected
  # Паттерн Шаблон (Паттерн) (заварить кофе, заварить чай)
  def get_names

  end

  def table_fields(object)
    []
  end

  private
  attr_accessor :sel_objects
  attr_reader :list
end
