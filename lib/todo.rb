class TodoItem

  attr_accessor :description, :due_date, :priority

  def initialize(description, options={})
    @description = description
    @due_date = options[:due_date] ? Date.parse(options[:due_date]) : options[:due_date]
    @priority = options[:priority]
  end

  def format_description
    "#{@description}".ljust(25)
  end

  def format_date
    @due_date ? @due_date.strftime("%D") : "No due date"
  end

  def format_priority
    level = "↑" if @priority == "high"
    level = "→" if @priority == "medium"
    level = "↓" if @priority == "low"
    level = "" if !@priority
    return level
  end

  def formatting
    format_description + "due: " + format_date + " " + format_priority
  end
end
