# README

[![RSpec](https://github.com/meerkat-camp/cms/actions/workflows/rspec.yml/badge.svg)](https://github.com/meerkat-camp/cms/actions/workflows/rspec.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/75677d635caedd03b093/maintainability)](https://codeclimate.com/github/meerkat-camp/cms/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/meerkat-camp/cms/badge.svg?branch=main)](https://coveralls.io/github/meerkat-camp/cms?branch=main)


Meerkat CMS is a Rails application that provides a web interface for managing small static websites.

## Design Goals

* A simple interface that can be used by non-technical users.
* Website should look like a real web-developer hand-coded them.
* Deployed websites should be static.
* Deployed websites should NOT load any external resources.
* Deployed websites should be as small as possible.
* Deployed websites should be SEO friendly.
* Deployed websites are on domains that belong to the user.

## Installation

```bash
# Install dependencies
brew install rclone
brew install hugo
brew install libvips

# Install Ruby with a version manager of your choice.
rbenv install 3.2.2
rbenv local 3.2.2

# Install GEMs.
bundle install

# Create databases
rails db:create
rails db:schema:load

# Start the application.
foreman start
```

## Testing

```bash
rspec
```

