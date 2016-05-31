class ActiveObject::Configuration

  attr_accessor :array, :date, :enumerable, :hash, :integer, :numeric,
                :object, :range, :string, :time

  def initialize
    @array = true
    @date = true
    @enumerable = true
    @hash = true
    @integer = true
    @numeric = true
    @object = true
    @range = true
    @string = true
    @time = true
  end

end
