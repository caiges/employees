
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "employeesdb/version"

Gem::Specification.new do |spec|
  spec.name          = "employeesdb"
  spec.license       = "MIT"
  spec.version       = Employeesdb::VERSION
  spec.authors       = ["Caige Nichols"]
  spec.email         = ["caigesn@gmail.com"]

  spec.summary       = %q{Query EMPLOYEES! They are worth it.}
  spec.description   = %q{A simple thing to query a really awesome employee database.}
  spec.homepage      = "https://www.github.com/caiges/lw-employees"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  spec.files         = Dir["{bin,lib}/**/*", "LICENSE", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = "employeesdb"
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-color", "~> 0.4.2"
  spec.add_dependency "tty-command", "~> 0.8.0"
  spec.add_dependency "tty-config", "~> 0.2.0"
  spec.add_dependency "tty-cursor", "~> 0.5.0"
  spec.add_dependency "tty-editor", "~> 0.4.0"
  spec.add_dependency "tty-file", "~> 0.6.0"
  spec.add_dependency "tty-font", "~> 0.2.0"
  spec.add_dependency "tty-markdown", "~> 0.3.0"
  spec.add_dependency "tty-pager", "~> 0.11.0"
  spec.add_dependency "tty-platform", "~> 0.1.0"
  spec.add_dependency "tty-progressbar", "~> 0.14.0"
  spec.add_dependency "tty-prompt", "~> 0.16.1"
  spec.add_dependency "tty-screen", "~> 0.6.4"
  spec.add_dependency "tty-spinner", "~> 0.8.0"
  spec.add_dependency "tty-table", "~> 0.10.0"
  spec.add_dependency "tty-tree", "~> 0.1.0"
  spec.add_dependency "tty-which", "~> 0.3.0"
  spec.add_dependency "pastel", "~> 0.7.2"
  spec.add_dependency "thor", "~> 0.20.0"
  spec.add_dependency "mysql2", "~> 0.5.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
