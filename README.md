# moxcli

moxcli is a command line interface to [Moxfield](https://www.moxfield.com), the best Magic: The Gathering deck building website around.

It is developed using Ruby.

I welcome any feature requests or bug reports! Please submit an issue [here](https://github.com/NeilsC/moxcli/issues).

## Installation

Eventually I'd like to make installation easier, but for now there are some manual steps involved.

moxcli requires [Ruby](https://www.ruby-lang.org/en/) to run. It is developed and tested using version 3.1.1. Ruby installation is platform-dependent. Here is a [guide](https://www.ruby-lang.org/en/documentation/installation/) to get you started.

Once you have Ruby installed, use `git` to clone this repository. In the repository folder on your system do the following:

Run bundler to install moxcli dependencies:

    $ bundle install

Configure moxcli with your account info:

    $ bin/moxcli config

## Usage

Moxcli just has some basic features at the moment. It can output a list of your decks, export the contents of a single (public) deck, or export the contents of all of your decks into text files.

Output contents of a single deck. You must specify the deck's public ID (you can find this in the deck's Moxfield URL):

    $ bin/moxcli get-deck "IzdWDH5u8EOmIeQ8fzriJw"

Output a list of your decks:

    $ bin/moxcli list-decks

Export the current contents of all of your decks.

    $ bin/moxcli export-decks EXPORT_PATH

`export-decks` has some options. CAUTION! This will overwrite existing files in the target folder:

    $ bin/moxcli export-decks ~/moxfield_decks --overwrite --create-folder

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neilsc/moxcli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/neilsc/moxcli/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Moxcli project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/neilsc/moxcli/blob/master/CODE_OF_CONDUCT.md).
