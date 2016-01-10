module ApplicationHelper

  def error_show(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, class: 'error_message' do
        model.errors[attribute].first
      end
    end
  end
end
