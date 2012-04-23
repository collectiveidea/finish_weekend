module NavigationHelpers
  def path_to(page_name)
    case page_name
    when "the homepage"
      "/"
    when "the management page"
      "/manage"
    when /^the "(.*?)" event page$/
      event_path(Event.find_by_name!($1))
    when /^the "(.*?)" registration page$/
      new_event_registration_path(Event.find_by_name!($1))
    when /^the (.+) page$/
      send("#{$1.parameterize("_")}_path")
    else
      raise %(Can't find mapping from "#{page_name}" to a path.)
    end
  end
end

World(NavigationHelpers)
