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

      option :overwrite, type: :boolean, default: false
      option :create_folder, type: :boolean, default: false
      desc "export-decks", "Exports all of your decks as text files in the specified folder"
      def export_decks(folder)
        if !Dir.exist?(folder)
          if !options[:create_folder]
            puts "Directory does not exist. Use --create-folder to have moxcli create it: #{folder}"
            exit 1
          else
            Dir.mkdir(folder)
          end
        end

        if !options[:overwrite] && !Dir.empty?(folder)
          puts "Directory is not empty. Use --overwrite to ignore this error."
          exit 1
        end

        acct = Moxfield::Account.current
        acct.decks.each do |deck_info|
          puts "Exporting deck: #{deck_info["name"]}"
          deck = Moxfield::Deck.new(deck_info["publicId"])
          deck_folder = deck_info.dig("folder", "name")
          file_name = "#{deck.name}.txt"
          if deck_folder
            dest_folder = File.join(folder, safe_filesystem_name(deck_folder))
            Dir.mkdir(dest_folder) if !Dir.exist?(dest_folder)
          else
            dest_folder = folder
          end
          file_name = File.join(dest_folder, safe_filesystem_name("#{deck.name}.txt"))
          File.write(file_name, deck.export)
        end
      end

      private

      def safe_filesystem_name(str)
        str.gsub(/[^0-9a-zA-Z\-._]/, '_')
      end
    end
  end
end
