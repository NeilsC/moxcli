# frozen_string_literal: true

module Moxcli
  module Moxfield
    # A Moxfield deck
    class Deck
      attr_reader :deck_id

      def initialize(deck_id)
        @deck_id = deck_id
        @moxfield_deck = Moxfield::API::V2.get_deck(deck_id)
      end

      def name
        moxfield_deck["name"]
      end

      def export
        [].tap do |export_contents|
          moxfield_deck["mainboard"].each do |mainboard_item|
            export_contents << "#{mainboard_item[1]["quantity"]} #{mainboard_item[0]}"
          end
        end.join("\n")
      end

      private

      attr_accessor :moxfield_deck
    end
  end
end
