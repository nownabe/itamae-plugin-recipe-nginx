# itamae-plugin-recipe-nownabe

Itamae recipes.

## Recipes
* nginx
* percona

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-nownabe', github: "nownabe/itamae-plugin-recipe-nownabe"
```

And then execute:

    $ bundle

## Usage
Include recipes you want to use in your recipe:

```ruby
require "itamae/default_attributes"
include_recipe "nownabe::nginx"
include_recipe "nownabe::percona"
```

## Contributing

1. Fork it ( https://github.com/nownabe/itamae-plugin-recipes-nownabe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
