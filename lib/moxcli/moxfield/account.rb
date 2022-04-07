# frozen_string_literal: true

module Moxcli
  module Moxfield
    # A Moxfield account
    class Account
      def self.current
        new
      end

      def initialize; end

      def self.get_token(user, password)
        Moxcli::Auth.get_token(user, password)
      end

      def decks
        API::V2.decks
      end

      def deck_names
        decks = API::V2.decks
        [].tap do |deck_list|
          decks.each do |deck|
            deck_list << deck["name"]
          end
        end.join("\n")
      end
    end
  end
end
