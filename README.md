# Spree FAQ

[![Build Status](https://travis-ci.org/futhr/spree-faq.svg?branch=master)](https://travis-ci.org/futhr/spree-faq)
[![Coverage Status](https://img.shields.io/coveralls/futhr/spree-faq.svg)](https://coveralls.io/r/futhr/spree-faq?branch=master)
[![Code Climate](https://codeclimate.com/github/futhr/spree-faq/badges/gpa.svg)](https://codeclimate.com/github/futhr/spree-faq)
[![Gem Version](https://badge.fury.io/rb/spree-faq.svg)](http://badge.fury.io/rb/spree-faq)

An opinionated `plug-and-play` styled Spree Commerce extension for managing FAQs. With this gem you get an FAQ page and the management tools to make it very easy to update your FAQ and reduce the demand on your sites customer service.

---

## Installation

Add to your `Gemfile`:

```ruby
gem 'spree-faq', github: 'futhr/spree-faq', require: 'spree_faq', branch: 'master'
```

Then run from the command line:

```sh
bundle && bundle exec rails g spree_faq:install
```

**Note:** The FAQ link is not add to the frontend layout, its up to you to place it in your layout where you prefer.

---

## Contributing

See corresponding [guidelines][1].

---

Copyright (c) 2009-2014 [Josh Nussbaum][2], [Tobias Bohwalli][3], and other [contributors][4], released under the [New BSD License][5]

[1]: https://github.com/futhr/spree-faq/blob/master/CONTRIBUTING.md
[2]: https://github.com/joshnuss
[3]: https://github.com/futhr
[4]: https://github.com/futhr/spree-faq/graphs/contributors
[5]: https://github.com/futhr/spree-faq/blob/master/LICENSE.md
