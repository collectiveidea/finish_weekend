module ApplicationHelper
  def event_title(event)
    "#{t(:finish_weekend)} #{event.name}"
  end
end
