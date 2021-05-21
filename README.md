# Rails Wallet Application

This is a basic wallet MVC app that allows users to withdraw, deposit and transfer money into wallets.

## Technologies Used
 - Generated using [Rails] Version 2.6.6(https://rubyonrails.org/)
 - The Rails application has been generated using Le Wagon [Rails Template](https://github.com/lewagon/rails-templates) to make development easier, faster, cleaner and customizable.
   -> Template script (https://raw.githubusercontent.com/lewagon/rails-templates/master/devise.rb)
 - [Bootstrap](https://getbootstrap.com/) for styling and responsiveness
 - [PostgreSql](https://www.postgresql.org/) for database

Noteworthy Gems:
 - Authentication: Devise (https://github.com/heartcombo/devise)
 - Authentication: Pundit (https://github.com/varvet/pundit)
 - Testing: Launchy (https://github.com/copiousfreetime/launchy) and capybara (https://github.com/teamcapybara/capybara)
 - User Input: Simple Form (https://github.com/heartcombo/simple_form)
 - Currency: Money-Rails (https://github.com/RubyMoney/money-rails)

## Features
A user can:
 - Create new wallets
 - Deposit money into a wallet
 - Withdraw money from a wallet
 - Send money to another user
 - Check a wallet’s balance
 - See a wallets transaction history
 - See their entire transaction history over all wallets

## Structure

The wallet app is based on a MVC architecture with 3 models (users, wallets, transactions)
 - A user has many wallets
 - A wallet has many transaction (a transaciton has two foreign keys, a sender_wallet and a receiver_wallet.)

Models:
  - Users: ```app/models/concerns/user.rb```
  - Wallets: ```app/models/concerns/wallet.rb```
  - Transactions: ```app/models/concerns/transaction.rb```

Controllers: ```app/controllers/concerns```:
  - Wallets: ```app/controllers/concerns/wallets_controller.rb```
  - Transactions: ```app/controllers/concerns/transactions_controller.rb```
  - Users: Devise user, see migration ```app/db/migrate/20210520044947_devise_create_users.rb```

Authorization Policies: ```app/policies```

## Setup

Clone the repository

```
git clone https://github.com/kkurcz/rails-wallet.git
```

Install dependencies

```
bundle install
```

View on Localhost
```
rails s
```

## Project Status
Project is: _in progress_ ⏳

## MIT License

Copyright (c) [2021] Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
