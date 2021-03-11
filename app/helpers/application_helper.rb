module ApplicationHelper
  def fill_categories
    return unless Category.first.nil?

    Category.create(name: 'Economy', priority: 1)
    Category.create(name: 'Education', priority: 2)
    Category.create(name: 'Science and Technology', priority: 3)
    Category.create(name: 'Entertainment', priority: 4)
  end

  def show_categories(cat)
    return ['-'] if cat.nil?

    cat
  end
end
