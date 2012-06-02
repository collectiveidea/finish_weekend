module HtmlSelectorsHelpers
  def selector_for(locator)
    case locator
    when "the page"
      "html > body"
    when "the navigation menu"
      "#navigation"
    when /^the "(.*?)" list$/
      "header:contains('#{$1}') + ol"
    when "the upcoming events list"
      "#upcoming-events"
    when "the current events list"
      "#current-events"
    when "the previous events list"
      "#previous-events"
    when "the event list"
      "#event-list"
    when "important details"
      ".important-details"
    when /^"(.+)"$/
      $1
    else
      raise %(Can't find mapping from "#{locator}" to a selector.)
    end
  end
end

World(HtmlSelectorsHelpers)
