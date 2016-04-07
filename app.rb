require 'date'

require_relative 'lib/errors'
require_relative 'lib/event'
require_relative 'lib/link'
require_relative 'lib/listable'
require_relative 'lib/todo'
require_relative 'lib/list'

list1 = List.new(title: "Glenn's List")
list1.add("todo", "Call Laurie", due_date: "April 7, 2016", priority: "high")
list1.add("event", "Attend Collision", start_date: "April 12, 2018", end_date: "April 14, 2018")
list1.add("link", "www.glennlangdon.com", site_name: "Glenn's site")
list1.add("todo", "Call Phyllis", due_date: "April 8 , 2016", priority: "low")
list1.all
list1.delete(4)
list1.all
