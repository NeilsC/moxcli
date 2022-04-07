# frozen_string_literal: true

module Moxcli
  module Moxfield
    # Moxfield API
    module API
      class Error < StandardError; end

      BASE_URL = "https://api.moxfield.com"

      def self.authorize(user, password)
        V1.get_token(user, password)
      end

      def self._client
        HTTP[accept: "application/json"]
      end
    end
  end
end
