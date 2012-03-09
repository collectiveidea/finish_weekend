env = YAML.load_file(File.expand_path("../application.yml", __FILE__)) rescue {}
env.each{|k,v| ENV[k] = v }
