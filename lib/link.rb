class LinkItem
  include Listable

  # attr_reader :type
  attr_accessor :description, :site_name

  def initialize(url, options={})
    # @type = "link"
    @description = url
    @site_name = options[:site_name]
  end

  def format_name
    @site_name
  end

  def formatting
    format_description + format_name
  end
end
