# Ruby on Rails Markdown Blog

[![Build Status](https://travis-ci.org/ralinc/rails-blog.svg?branch=master)](https://travis-ci.org/ralinc/rails-blog)
[![Test Coverage](https://codeclimate.com/github/ralinc/rails-blog/badges/coverage.svg)](https://codeclimate.com/github/ralinc/rails-blog/coverage)
[![Code Climate](https://codeclimate.com/github/ralinc/rails-blog/badges/gpa.svg)](https://codeclimate.com/github/ralinc/rails-blog)

*Disclaimer*: The repo is no longer maintained as I migrated my blog to Middleman
as it barely has any dynamic content and fails to justify its deployment costs.
Also, having my blog posts under version control seems much more convenient than
having them in a database. Still you can review the code and use any part of it
for your own Rails blog.

---

This is the source code repository for my digital space
[www.ralin.net](http://www.ralin.net/). The website contains some information
about me, social links and my blog. It is built using open source software and
tools like Ruby on Rails and PostgreSQL. Its source code is completely open and
any part of it can be used for any purpose.

## Stack

- Language: Ruby 2.3
- Web Framework: Rails 5.1
- Storage: PostgreSQL 9.6
- Deployment: AWS

## Features

- Markdown blog using [Redcarpet](https://github.com/vmg/redcarpet)
- Authentication with [Devise](https://github.com/plataformatec/devise)
- Single admin user
- WiP (private) and published (public) blog posts
- Social share buttons via [social-share-button](https://github.com/huacnlee/social-share-button)
- Blog post comments with [Disqus](https://disqus.com/)
- Blog post friendly URL (slug)
- Blog post tagging
- Blog pagination with [Kaminari](https://github.com/kaminari/kaminari)
