# frozen_string_literal: true

require "thor"

module Moxcli
  class CLI < Thor
    desc "test", "yep"
    def test
      puts "Hello planeswalker!"
    end
  end
end
