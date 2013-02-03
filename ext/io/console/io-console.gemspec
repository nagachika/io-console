# -*- ruby -*-
_VERSION = "0.4.0.1"

Gem::Specification.new do |s|
  s.name = "io-console"
  s.version = _VERSION
  s.date = "2013-02-03"
  s.summary = "Console interface"
  s.email = "nobu@ruby-lang.org"
  s.description = "add console capabilities to IO instances."
  s.homepage = "http://www.ruby-lang.org"
  s.authors = ["Nobu Nakada"]
  s.require_path = %[.]
  s.files = %w[console.c extconf.rb lib/console/size.rb]
  s.extensions = %w[extconf.rb]
end
