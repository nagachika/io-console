# -*- ruby -*-
_VERSION = IO.popen(%W[git -C #{__dir__} describe --tags --match v[0-9]*], &:read)[/\Av?(\d+(?:\.\d+)*)/, 1]

Gem::Specification.new do |s|
  s.name = "io-console"
  s.version = _VERSION
  s.summary = "Console interface"
  s.email = "nobu@ruby-lang.org"
  s.description = "add console capabilities to IO instances."
  s.required_ruby_version = ">= 2.4.0"
  s.homepage = "https://github.com/ruby/io-console"
  s.metadata["source_code_url"] = s.homepage
  s.authors = ["Nobu Nakada"]
  s.require_path = %[lib]
  s.files = %w[
    LICENSE.txt
    README.md
    ext/io/console/console.c
    ext/io/console/extconf.rb
    ext/io/console/win32_vk.inc
    lib/io/console/size.rb
  ]
  s.extensions = %w[ext/io/console/extconf.rb]

  if i = ARGV.index("--") and !(argv = ARGV[i+1..-1]).empty?
    OptionParser.new(__FILE__) do |opt|
      opt.on("--platform=PLATFORM") {|p| s.platform = p}
    end.parse!(argv)
  end
  if Gem::Platform === s.platform and s.platform =~ 'java'
    s.files.delete_if {|f| f.start_with?("ext/")}
    s.extensions.clear
    s.require_paths.unshift("jruby")
    s.files.concat(%w[
      jruby/io/console.rb
      lib/io/console/jruby.rb
      lib/io/console/jruby/bsd_console.rb
      lib/io/console/jruby/common.rb
      lib/io/console/jruby/linux_console.rb
      lib/io/console/jruby/native_console.rb
      lib/io/console/jruby/stty_console.rb
      lib/io/console/jruby/stub_console.rb
    ])
  end

  s.license = "BSD-2-Clause"
end
