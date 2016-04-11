class EventItem
  include Listable

  # attr_reader :type
  attr_accessor :description, :start_date, :end_date

  def initialize(description, options={})
    # @type = "event"
    @description = description
    @start_date = options[:start_date] ? Chronic.parse(options[:start_date]) : options[:start_date]
    @end_date = options[:end_date] ? Chronic.parse(options[:end_date]) : options[:end_date]
  end

  def format_start
    @start_date ? @start_date.strftime("%D") : "No start date"
  end

  def format_end
    @end_date ? @end_date.strftime("%D ") : "No end date"
  end

  def formatting
    format_description + format_start + format_end
  end
end
