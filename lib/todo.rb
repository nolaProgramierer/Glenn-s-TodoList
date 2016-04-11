class TodoItem
  include Listable

  # attr_reader :type
  attr_accessor :description, :due_date, :priority

  def initialize(description, options={})
    # @type = "todo"
    @description = description
    @due_date = options[:due_date] ? Chronic.parse(options[:due_date]) : options[:due_date]
    @priority = options[:priority]
  end

  def format_date
    @due_date ? @due_date.strftime("%D") : "No due date"
  end

  def format_priority
    level = "↑".colorize(:red) if @priority == "high"
    level = "→".colorize(:orange) if @priority == "medium"
    level = "↓".colorize(:green) if @priority == "low"
    level = "" if !@priority
    return level
  end

  def formatting
    format_description + "due: " + format_date + " " + format_priority
  end
end
