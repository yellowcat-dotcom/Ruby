class DBUniversity
  #Bcgjkmpjdfybt @@ - кринж, так как если данный класс будет наследовать, то переменная класса переопределится с таким же значением
  private_class_method :new
  @instance_mutex = Mutex.new

  def initialize
    @client = SQLite3::Database.open 'C:\Users\valen\RubymineProjects\untitled\identifier.sqlite'
    @client.results_as_hash = true
  end

  def self.instance
    return @instance if @instance

    @instance_mutex.synchronize do
      @instance ||= new
    end
    @instance
  end

  def prepare_exec(statement, *params)
    @client.prepare(statement).execute(*params)
  end

  def query(statement)
    @client.query(statement)
  end


end

