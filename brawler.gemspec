Gem::Specification.new do |s|
  s.name = "brawler"
  s.version = "0.0.1"
  s.date = "2016-07-09"
  s.summary = "Game data from Heroes of the Storm"
  s.description = s.summary
  s.authors = ["Mario Cuba"]
  s.email = ["mario@mariocuba.net"]
  s.files = ["lib/brawler.rb"] # @TODO: load files dynamically
  s.homepage = nil # at the moment
  s.license = "MIT"

  # Dependencies
  s.add_runtime_dependency "json", ["<= 1.8.3"]
end
