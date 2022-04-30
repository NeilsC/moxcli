# frozen_string_literal: true

module Moxcli
  module Moxfield
    module API
      # Moxfield API v1
      module V1
        VERSION = "/v1/"

        def self.get_token(user, password)
          payload = { "userName" => user, "password" => password }
          uri = URI.join(BASE_URL, VERSION, "account/token")
          response = API._client.post(uri, json: payload)

          if response.status.success?
            response.parse
          else
            warn "Moxfield authentication failed. Reason: #{response.reason}"
            raise Error, "Authentication failed"
          end
        end

        def self.refresh_token(refresh_token)
          payload = { "refreshToken" => refresh_token }
          uri = URI.join(BASE_URL, VERSION, "account/token/refresh")
          response = API._client.post(uri, json: payload)

          if response.status.success?
            response.parse
          else
            warn "Moxfield token refresh failed. Reason: #{response.reason}"
            warn "Running `moxcli config` should fix this."
            raise Error, "Token refresh failed"
          end
        end
      end
    end
  end
end
