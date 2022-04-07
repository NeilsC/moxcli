# frozen_string_literal: true

module Moxcli
  module CLI
    # Moxcli CLI
    class Main < Thor
      desc "config", "Configure Moxcli"
      def config
        print "Moxfield user name: "
        user = STDIN.gets.chomp
        print "Moxfield password: "
        password = STDIN.gets.chomp
        puts "Testing Moxfield credentials"
        Moxfield::Account.get_token(user, password)
        puts "Success"
      end

      desc "get-deck", "Retrieves the content of a deck"
      def get_deck(deck_id)
        deck = Moxfield::Deck.new(deck_id)
        puts deck.export
      end

      desc "list-decks", "Outputs a list of your decks"
      def list_decks
        acct = Moxfield::Account.current
        puts acct.deck_names
      end

      desc "export-decks", "Exports all of your decks as text files in the specified folder"
      def export_decks(folder)
        if !Dir.exist?(folder)
          puts "directory does not exist"
          exit 1
        end

        if !Dir.empty?(folder)
          puts "directory is not empty"
          exit 1
        end

        acct = Moxfield::Account.current
        acct.decks.each do |deck|
          deck = Moxfield::Deck.new(deck["publicId"])
          file_name = "#{deck.name}.txt"
          File.write(File.join(folder, file_name), deck.export)
        end
      end
    end
  end
end
