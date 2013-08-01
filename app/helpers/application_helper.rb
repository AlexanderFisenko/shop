module ApplicationHelper

  def items_in_cart
    Item.where(id: session[:items_in_cart].keys)
  end

  def default_title(default_title)
    content_for?(:title) ? content_for(:title) : default_title
  end

  def title(page_title)
    content_for(:title) { page_title.to_s }
  end

end
