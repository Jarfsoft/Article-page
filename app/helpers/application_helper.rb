module ApplicationHelper
  def show_categories(cat)
    return ['-'] if cat.nil?

    cat
  end
end
