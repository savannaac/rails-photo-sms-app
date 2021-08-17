# ZigZag
**ZigZag** is a Rails app that lets users store linked photos and also share them with others to like. 

  * Upload photos, edit, or delete them 
  * Select as either private or public
  * Public photos are shared on the public feed, where users can like them
  

## Installation 
Fork the repo & clone to your computer

  `git clone git@github.com:your-github-account/rails-photo-sms-app.git`

Enter the folder created by the clone

  `cd rails-photo-sms-app`

Install dependencies

  `bundle install`

Run migrations

  `rails db:migrate`

Start Rails server

  `rails s`

Open browser to `localhost:3000`


## Usage
After running the program & creating an account or logging in through an existing Google account, 

1. Create a photo through a direct URL link (image hosting required)
2. Write an optional description
3. Select either private or public - public photos are shared on the public feed, where everyone can see
4. Maintain by updating or deleting photos
5. Like or Super Like on the public feed


## Contributing
Bug reports & pull requests are welcome. 

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant [Code of Conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).


## License
This project is licensed under the [MIT License](https://www.mit.edu/~amini/LICENSE.md).
