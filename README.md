# gRabit Project App 

- This project contains a basic Rails app skeleton.
- This file has instructions needed for this Project App to run.

## Getting Started

Once you've cloned this repo and have a working directory, you can perform the following steps to setup and run the app.

`cd` into the project working directory. You should see that a `ruby-2.6.5@project-app` gemset gets created the first time you do this.

You may want to run `bundle update` to make sure that your global installs of the `bundler` and `rails` gems are up to date with any bug/security patches.

Run `bundle install` to install all the other gem dependencies in the `project-app` gemset.

Run `yarn install` to install all the JS dependencies in a `node_modules` folder.

Run `rails db:migrate:reset` to create/reset the project databases.

Run `sudo apt-get update`

Run `sudo apt-get install imagemagick`



## About the Project Skeleton

- It uses the gemset `project-app`. (See the `.ruby-gemset` file.)

- It includes the `annotate` gem and is configured to automatically annotate model code files when you run database migrations.

- It includes the `devise` authentication gem; however, Devise-base authentication has not yet been added to the project.

- It includes the `bootstrap` and `bootswatch` packages, and the project is configured to use them. In particular, the app is initially configured to use the `yeti` Bootswatch theme. (See the `app/assets/stylesheets/application.scss` file.)


## What you can do after running this app

In Sign-up, User can create a new account in gRabit as a Buyer/Seller as per your wish.

- As example, 'Alice' wants to sign-up as a seller. 

- Name: Alice
- Username: Alice ( as per your wish).
- Phonenumber: (optional)
- Email: alice@example.com (as per your wish).
- password: alice123 (as per your wish).
- check the box as a Seller.
- Alice's account is created!

In SignIn, User can login as an existing user if you have already signed-up. 

- As example, you can Sign-in as a Buyer named 'Bob'. What Bob needs for Sign-In is:

- Email: Bob@example.com (same as sign-up)
- password: bob123 (same as sign-up)

 Only one Administrator can access all user control features. 
 
- Administrator can sign-in as:

- Email: admin@example.com
- Password: admin123

If you logged in as a seller. You can add items for selling by going to Add Item tab.

If you are a buyer, you can search items from the search box or categories from the dropdown.  

Note: There are already some seeded data in the project. 
