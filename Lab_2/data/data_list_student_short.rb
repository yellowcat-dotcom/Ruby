require_relative 'data_list'
class DataListStudentShort<DataList

  def initialize(objects)
    super(objects)
  end

  def get_names
    ["№","ФИО", "Гит", "Контаке"]
  end
  #Переопределенный метод
  protected def table_fields(object)
    [object.shortName, object.git, object.contact]
  end
end
