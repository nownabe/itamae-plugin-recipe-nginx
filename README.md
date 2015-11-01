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

### Percona
```ruby
require "itamae/default_attributes"

# Install Percona Server
include_recipe "nownabe::percona::server"

# Only server
include_recipe "nownabe::percona::server::server"

# Only client
include_recipe "nownabe::percona::server::client"

# Only devel
include_recipe "nownabe::percona::server::devel"
```

### Nginx
```ruby
require "itamae/default_attributes"

# Install Nginx
include_recipe "nownabe::nginx::default"
```

## Contributing

1. Fork it ( https://github.com/nownabe/itamae-plugin-recipes-nownabe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
