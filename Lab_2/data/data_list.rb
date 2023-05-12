# frozen_string_literal: true
require_relative 'data_table'
class DataList
  #private_class_method :new
  attr_writer :list
  def initialize(objects)
    #self.sel_objects = []
    self.list = objects #self.objects_list
    @observers = []
  end

  def add_observer(observer)
    @observers.append(observer)
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end
  def notify
    @observers.each { |observer| observer.on_datalist_changed(get_data) }
  end
  # def select(number)
  #   #raise ArgumentError, "arg 'number' not Integer" if number.class != Integer
  #   sel_objects.append(number)
  # end

  def select_elem(number)
    self.sel_object = number
  end

  # очистить массив выборки
  # def clear_select
  #   self.sel_objects = []
  # end

  # def get_selected
  #   return [] if sel_objects.empty?
  #   list_id=[]
  #   sel_objects.each do |i|
  #     list_id.append(list[i].id)
  #   end
  #   list_id
  # end
  def selected_id
    list[sel_object].id
  end

  def get_data
    index_id=0
    dt = list.inject([]) do |res, object|
      row=[index_id]
      row.append(*table_fields(object))
      index_id+=1
      res<<row
    end
    DataTable.new(dt)
  end

  def replace_objects(objects)
    self.list = objects.dup
    notify
  end

  protected
  def get_names

  end

  def table_fields(object)
    []
  end

  private
  attr_accessor :sel_object
  attr_reader :list
end