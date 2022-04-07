# frozen_string_literal: true

require "debug"
require "thor"
require "http"
require "uri"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect("cli" => "CLI")
loader.inflector.inflect("api" => "API")
loader.setup

module Moxcli
  class Error < StandardError; end
end
