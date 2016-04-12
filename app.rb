require 'date'
require 'colorize'
require 'chronic'

require_relative 'lib/listable'
require_relative 'lib/errors'
require_relative 'lib/todo'
require_relative 'lib/list'
require_relative 'lib/event'
require_relative 'lib/link'

list1 = List.new(title: "Glenn's List")
list1.add("todo", "Call Laurie", due_date: "today", priority: "high")
list1.add("event", "Attend Collision", start_date: "next week", end_date: "week after next")
list1.add("link", "www.glennlangdon.com", site_name: "Glenn's site")
list1.add("todo", "Call Phyllis", due_date: "April 8 , 2016", priority: "low")
puts list1.title
list1.all
list2 = List.new
list2.add("todo", "Call Andrea", due_date: "tomorrow", priority: "medium")
list2.add("event", "La Fête du Ballet", start_date: "this Saturday", end_date: "this Saturday")
list2.add("link", "www.phyllis.com", site_name: "Phyllis' site")

puts list2.title
list2.all

list1.filter("event")
list1.filter("link")

list1.find_by_description("Call Laurie")
