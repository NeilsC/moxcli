# frozen_string_literal: true

module Moxcli
  module Auth
    TOKEN_PATH = File.join(Dir.pwd, ".token")
    @@latest_token = {}

    def self.bearer_token
      read_token

      if token_expired?
        refresh_token
      end

      @@latest_token["access_token"]
    rescue Moxfield::API::Error
      warn "Aborting due to error."
      exit 1
    end

    def self.write_token(token)
      File.write(TOKEN_PATH, JSON.dump(token))
    end

    def self.read_token
      @@latest_token = JSON.parse(File.read(TOKEN_PATH))
      @@latest_token
    rescue Errno::ENOENT
      warn "Couldn't read auth token from file. Running `moxcli config` again should fix this"
      raise
    end

    def self.get_token(user, password)
      @@latest_token = Moxfield::API::V1.get_token(user, password)
      write_token(@@latest_token)
      @@latest_token
    end

    def self.refresh_token
      @@latest_token = Moxfield::API::V1.refresh_token(@@latest_token["refresh_token"])
      write_token(@@latest_token)
      @@latest_token
    end

    def self.token_expired?
      DateTime.now > DateTime.parse(@@latest_token["expiration"])
    end
  end
end
