class DBUniversity
  # @@ - кринж, так как если данный класс будет наследовать, то переменная класса переопределится с таким же значением
  private_class_method :new
  # Создаем мьютекс для синхронизации доступа к переменной @instance он позволяет "захватить" доступ к общему ресурсу,
  # чтобы другие потоки не могли получить доступ к защищенному коду, пока мьютекс не будет освобожден.
  @instance_mutex = Mutex.new

  # Инициализируем объект, открывая БД и настраивая её на возвращение результатов в виде хешей
  def initialize
    @client = SQLite3::Database.open 'C:\Users\valen\RubymineProjects\untitled\identifier.sqlite'
    @client.results_as_hash = true
  end


  # Метод, возвращает ЕДИНСТВЕННЫЙ экземпляр класса DBUniversity.
  def self.instance
    return @instance if @instance

    # Иначе захватываем мьютекс, чтобы ТОЛЬКО ОДИН поток мог создать экземпляр класса.
    @instance_mutex.synchronize do
      @instance ||= new
    end
    @instance
  end

  # Методы, принимают SQL-запрос (и параметры), возвращает результаты запроса.
  def prepare_exec(statement, *params)
    @client.prepare(statement).execute(*params)
  end

  def query(statement)
    @client.query(statement)
  end


end

