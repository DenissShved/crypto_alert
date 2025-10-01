# Crypto Alert

A Ruby on Rails application for tracking cryptocurrency prices and triggering alerts when conditions are met.

## Overview

This app allows users to:

- Create alerts for specific cryptocurrencies (e.g., Bitcoin, Ethereum)
- Set conditions (`above` or `below`) and target prices
- Receive notifications (email/log) when price conditions are met
- Background job processing via Sidekiq and scheduled checks via sidekiq-scheduler

---

## Requirements

- Ruby 3.2.x
- Rails 8.x
- PostgreSQL (or SQLite for development)
- Redis (for Sidekiq)
- Bundler (`gem install bundler`)

---

## Setup

1. Clone the repository:

```bash
git clone <repo_url>
cd crypt-alert
```
2. Install dependencies:

```
bundle install
```
3. Set up the database:
```
rails db:create
rails db:migrate
rails db:seed   # optional: creates a sample user
```

4. Start Redis (Sidekiq backend):
```
redis-server
```

5. Start Sidekiq:
```
bundle exec sidekiq
```

6. Run Rails server:
```
rails s
```

Access the app at http://localhost:3000
