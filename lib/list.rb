class List

  attr_reader :items
  attr_accessor :title

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end

  def add(type, description, options)
    type = type.downcase
    priority = options[:priority]
    unless (type == "todo") || (type == "event") || (type == "link")
      raise TodoListErrors::InvalidItemType
    end
    unless (priority == "high") || (priority == "medium") || (priority == "low") || (!priority)
      raise TodoListErrors::InvalidPriorityValue
    end
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
      puts "#{index + 1}" + ") " + "#{value.formatting}"
    end
    separator
  end

  def delete(index)
    if (index > @items.length + 1)
      raise TodoListErrors::IndexExceedsListSize, "Your index number is greater than length of list."
    else
      @items.delete_at(index - 1)
    end
  end

# use these methods with type attribute in classes
  # def filter(type)
  #   select_type(type).each_with_index do |value, index|
  #     puts "#{index + 1}" + ") " + "#{value.formatting}"
  #   end
  # end
  #
  # def select_type(type)
  #   @items.select { |item| item.type == type }
  # end

# find items by looking for class of object

  def filter(type)
    filter_class(type).each_with_index do |value, index|
      puts "Type: " + "#{type}".capitalize +  "\n#{index + 1}" + ") " + "#{value.formatting}"
    end
  end

# iterates through obj array looking for description attribute
  def find_by_description(desc)
    description_array = []
    @items.each do |item|
      if item.description == desc
        description_array.push(item)
      end
    end
    print_description(description_array)
  end
# outputs and formats description array if not empty
  def print_description(desc_array)
    if desc_array.empty?
      puts "Your search yields no results."
    else
      desc_array.each { |item| puts item.formatting }
    end
  end

  private
  def filter_class(type)
    type = type.downcase
    type_array = []
    if type == "todo"
      type_array = @items.select { |item| item.class == TodoItem }
    elsif type == "event"
      type_array = @items.select { |item| item.class == EventItem }
    elsif type == "link"
      type_array = @items.select { |item| item.class == LinkItem }
    end
    type_array
  end


end
