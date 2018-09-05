

# GORENET
### A message board built to promote the launch of GOREFEST, an tabletop RPG.


## Built With
  * Sinatra - micro framework for ruby
  * PostrgeSQL
  * Active Record
  * Bootstrap
  * Heroku
## Test Credentials:  
For access to the forums enter the following login info:
       username: demo 
       password:123
 The sign up page is hidden under the a link on the landing page under EXECUTE.
 ## Goal:

To create a fullstack simple blog website that enables someone to sign up for an account and create relevant posts on a topic of their choosing.

### Heroku 
<https://gorenet.herokuapp.com/>


### Learning Objectives:  

Upon successful completion of this project, the student will demonstrate an understanding of Sinatra, ActiveRecord, Cookies and deploying to Heroku.
 
### Instructions:

A blog, or weblog, is a platform where you can share information about a particular topic usually displayed much like diary entries in reverse chronological order. Some popular blogging platforms include Wordpress (Links to an external site.)Links to an external site., Tumblr (Links to an external site.)Links to an external site. and Medium (Links to an external site.)Links to an external site.. If you are not familiar, we recommend you spend some time looking at some of the blogging platforms listed to familiarize yourself with how they work. During this initial research phase it will be helpful for identify how these applications work on a fundamental level and note them.

When researching, ask yourself the following questions:

* What is the procedure for posting a new entry?
* How does the design influence the user experience when using the application?
  * How are colors used?
  * How do they hook you into using their product?
  * What fonts are used and how does this contribute to the user experience?
* How do you sign up for an account?
* What does their login page look like?
* What nomenclature is used for their urls and routing?
* Can I see other people’s posts?
  * How do I go about doing that?

For this project, your task is to create a basic blog for people who enjoy ________ . Where the blank is filled in by you. You can create a blogging platform for people who enjoy dogs, music, cars or food. However, do not feel limited by these examples, the choice is up to you. The only limitation is that the blank must be filled by one word. This is designed purposefully to prevent too large of a scope. Keep it simple. Finally, in order to make it official, this project will be deployed to the heroku platform, so please familiarize yourself with heroku beforehand.
tags to multiple posts
 
### Completion Requirements:

The completed assignment should:

* have a way to create an account (sign up) with at least
  * first name
  * last name
  * email
  * birthday
* have a way to login to an account
* have a way to logout of their account
* show login and signup links only when logged out
* show logout links only when logged in
* have a way to cancel their account
* have a way to create a new post only when logged in
* have a page that lists out the 20 most recent posts made by the * currently logged in user
* have a page that lists the currently logged in user’s profile information
* have the ability to see other user’s last 20 posts
* be deployed to Heroku
* use Activerecord to make all database transactions
* use Sinatra as the web microframework backend
       
       
## Future
 The current version is built using Sinatra.  Future version will be redeployed via  Ruby on Rails.  Using ActiveStorage image uploading will be built in and additionaly user authentication via Devise for launch with the game.  
