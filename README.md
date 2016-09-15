# Ruby on Rails Markdown Blog
[![Code Climate](https://codeclimate.com/github/ralinc/ralin.net/badges/gpa.svg)](https://codeclimate.com/github/ralinc/ralin.net)
[![Test Coverage](https://codeclimate.com/github/ralinc/ralin.net/badges/coverage.svg)](https://codeclimate.com/github/ralinc/ralin.net/coverage)

This is the source code repository for my digital space [www.ralin.net](http://www.ralin.net/). The website contains some information about me, social links and my blog. It is built using open source software and tools like Ruby on Rails, Sass, CoffeeScript and PostgreSQL. It is deployed on [OpenShift](https://www.openshift.com/), the PaaS by Red Hat, running on Passenger inside Apache. Its source code is completely open and any part of it can be used for any purpose. It is built from a scratch using a minimal set of dependencies. The project has 100% code coverage. You can take a look at the specs to see how I test every bit of a Rails application using RSpec and Capybara.

## How to use it?

- copy and use any snippet you like
- follow my approach to any problem you face
- fork the repo and use it for your own personal blog

## How to help?

- star the repository if you like it
- follow me to get updates on its developments
- review code and propose better approaches
- create issues for bugs or features you need
- open pull requests

## Stack

- Language: Ruby
- Web Framework: Rails
- Storage: PostgreSQL
- Deployment: OpenShift

## Features 

- Markdown blog using [Redcarpet](https://github.com/vmg/redcarpet)
- Single admin user
- Password authentication
- Protected access to admin area
- Embedding gravatar images
- WiP (admin-only-visible) and published blog posts
- Blog post friendly URL (slug)
- Facebook 'Like' button with likes count
- Social share buttons via [social-share-button](https://github.com/huacnlee/social-share-button)
- Blog post comments via [Disqus](https://disqus.com/)
- Google analytics working with [Turbolinks 5](https://github.com/turbolinks/turbolinks)
- Blog posts tagging
