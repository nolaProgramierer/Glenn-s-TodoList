class List
  attr_accessor :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end

  def separator
    puts "-" * @title.length
  end

  def all
    separator
      @items.each_with_index do |value, index|
      puts "#{index + 1}" + ") " + value.formatting
    end
    separator
  end

  def delete(index)
    @items.delete_at(index - 1)
  end
end
