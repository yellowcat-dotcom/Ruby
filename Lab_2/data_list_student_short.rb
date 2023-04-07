require_relative 'data_table'
class DataListStudentShort<DataTable

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
