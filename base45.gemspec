require_relative 'lib/base45/version'

Gem::Specification.new do |spec|
  spec.name          = "base45"
  spec.version       = Base45::VERSION
  spec.authors       = ["Sven Clement"]
  spec.email         = ["sven@accounttech.lu"]

  spec.summary       = %q{Base54 encoder & decoder. Used a.o. in Covid Health Certificates}
  spec.homepage      = "https://github.com/svnee/base54"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/svnee/base54"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
