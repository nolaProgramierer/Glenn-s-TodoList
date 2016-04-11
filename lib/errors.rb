module TodoListErrors
  class InvalidItemType < StandardError
  end

  class IndexExceedsListSize < StandardError
  end
  
  class InvalidPriorityValue < StandardError
  end
end
