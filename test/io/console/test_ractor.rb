# frozen_string_literal: true
require 'test/unit'

class TestIOConsoleInRactor < Test::Unit::TestCase
  def setup
    omit unless defined? Ractor
  end

  def test_ractor
    assert_separately([], "#{<<-"begin;"}\n#{<<-'end;'}")
    begin;
      require "io/console"
      if console = IO.console
        $VERBOSE = nil
        r = Ractor.new(console) do |io|
          io.getch(intr: true, time: 0.1, min: 0)
        end
        result = r.take
      end
      assert_nil(result)
    end;
  end
end
