class LinkItem
  attr_accessor :description, :site_name

  def initialize(description, options={})
    @url = description
    @site_name = options[:site_name]
  end

  def format_description
    "#{@url}".ljust(25)
  end

  def format_name
    @site_name
  end

  def formatting
    format_description + format_name
  end
end
