# frozen_string_literal: true

require "test_helper"

class TestInspectacular < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Inspectacular::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
