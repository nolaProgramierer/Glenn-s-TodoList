module TodoListErrors
  class InvalidItemType < StandardError
  end

  class IndexExceedsListSize < StandardError
  end

  class InvalidPriorityValue < StandardError
  end

  class InvalidSearchValue < StandardError
  end
end
