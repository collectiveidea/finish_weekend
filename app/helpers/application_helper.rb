module ApplicationHelper
  def event_title(event)
    "#{t(:finish_weekend)} #{event.name}"
  end

  def event_dates(event)
    string = event.starts_at.strftime("%B %-d - ")
    string << event.ends_at.strftime("%B ") unless event.starts_at.month == event.ends_at.month
    string << event.ends_at.strftime("%-d")
  end
end
