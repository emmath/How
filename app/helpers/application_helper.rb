module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "How").join(" - ")
      end
    end
  end
end
