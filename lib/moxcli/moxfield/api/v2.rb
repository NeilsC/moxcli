# frozen_string_literal: true

module Moxcli
  module Moxfield
    module API
      # Moxfield API v2
      module V2
        VERSION = "/v2/"

        def self.get_deck(deck_id)
          uri = URI.join(BASE_URL, VERSION, "decks/all/", deck_id)
          API._client.get(uri).parse
        end

        def self.decks
          # HTTP.default_options = HTTP::Options.new(features: { logging: { logger: Logger.new(STDOUT) } })
          uri = URI.join(BASE_URL, VERSION, "decks")
          API._client.auth("Bearer #{Moxcli::Auth.bearer_token}").get(uri).parse
        end
      end
    end
  end
end
