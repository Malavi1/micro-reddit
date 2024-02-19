### This is the nothing but the simple blog post app backend

The  main aim of this mini reddit is to get an idea on the rails 
1. Assosiactions
2. Validations
   
#### Overview
At the end the main aim of this application is to create simple blog app the features are.
* User signin
* Blog post creation
* Commenting

# User Model Creation
```
rails g model User username:string email:string password:string

```

This will create bunch of files but the most focused one is **app/model/user.rb** this is the where we write our validations.

After write validation according your choice & run the migration using `rails db:migrate`
```
validates :username, presence:true
validates :email, presence:true, uniqueness:true
validates :password, presence:true, length: {minimum: 8}

```

# Blog Post Creation
*We can create blog post just modifying the above command little bit but the trick is we need to connect the user model with post model*
```
rails g model Post title:string context:text user:references 
```
If you observe that connection is nothing but referencing the User model with Post model, also change the associations accordingly & add validation to the Post model
```
validates :title, acceptance: { message: 'Must container title for the blog'}
validates :context, acceptance: { message: 'Must containe context for the blog'}
```

If your observe shema.rd file your will see there is addition of **foreign_key** related to **user_id** in the post table this is responsiblr for connecting the 2 models

**note:** while creating a post don't forget to add the user_id other wise it will through you an error

# Comment Model
Unless post model while creating Comment we need to reference both User & Post Model
```
rails g model Comment comment:string user:references post:references
```
change the assosiations & validations accordingly
```
validates :comment, presence:true
```
# The Assosications List that I use
 ## User Model
```
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
```
 ## Post Model
 ```
belongs_to :user
```
## Comment Model
```
  belongs_to :user
  belongs_to :post

```
![reddit](https://github.com/Malavi1/micro-reddit/assets/112646623/5bd3ac79-e7e7-4f04-8d6a-f78ee2bc2026)







