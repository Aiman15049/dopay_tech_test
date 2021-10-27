# DoPay tech test


### Getting up and running

 - `$ git clone ghttps://github.com/Aiman15049/dopay_tech_test.git`
 - `$ cd dopay_tech_test`
 - `$ bundle`
 - `$ rails db:seed`
 - `$ rails server`
 - Head to 'localhost:3000/employees' to view the 100 most recent employees in JSON

### Features and how to use the app
- Create 1000 fake Employee data and view via the index as JSON, paginated acccording to your params.
- Uses limit and offset to paginate so adjust your urls accordingly in order to view the data however you like, for example: 'localhost:3000/employees?offset=100' will give you a page of 100 starting from the 100th point in the order (which in this case is most recent)

- whereas 'localhost:3000/employees?offset=200' will give you a page of 100 starting from the 200th point

### Running tests and linters

- `$ rubocop`
- `$ rspec`

### Nice to haves if I had more time
- Properly implemented pagination (All the logic is there - just need to apply next / last buttons)
