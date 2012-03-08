module NavigationHelpers
  def path_to(page_name)
    case page_name
    when "the homepage"
      "/"
    when /^the (.+) page$/
      send("#{$1.parameterize("_")}_path")
    else
      raise %(Can't find mapping from "#{page_name}" to a path.)
    end
  end
end

World(NavigationHelpers)
