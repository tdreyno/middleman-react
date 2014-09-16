# Middleman-React

`middleman-react` is an extension for the [Middleman] static site generator that compiles applications using the [React.js](http://facebook.github.io/react/) framework through [Browserify](http://browserify.org).

## Installation

If you're just getting started, install the `middleman` gem and generate a new project:

```
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add `gem "middleman-react"` to your `Gemfile` and run `bundle install`

## Configuration

```
activate :react do |r|
  r.targets << {
  	main: 'js/app/main.js',
  	output: 'js/app.compiled.js',
  	minify: app.production?,
  	debug: app.development?,
  	env: {
  	  HTTP_PREFIX: '/app/'
  	}
  }
}
```

This will run Browserify, starting at the `source/js/app/main.js` file, resolve dependencies and compile to a single file. In "build" mode, it will minify the contents. In "dev" mode, it will use Source Maps. Finally, you can pass as many ENV variables you want to the Browserify process.

## Build & Dependency Status

[![Gem Version](http://img.shields.io/gem/v/middleman-react.svg?style=flat)][gem]
[![License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)][license]
[![Build Status](http://img.shields.io/travis/middleman/middleman-react.svg?style=flat)][travis]
[![Gittip](http://img.shields.io/gittip/middleman.svg?style=flat)][gittip]

## Community

The official community forum is available at: http://forum.middlemanapp.com

## License

Copyright (c) 2012-2014 Thomas Reynolds. MIT Licensed, see [LICENSE] for details.
