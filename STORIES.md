# Questions

- Bill upon account creation or allow trial period?
- What is "interactive guide" from outline?

# Guests

As a guest, I can view free episodes.

As a guest, I can create an account.
- Enter email address
- Enter name
- Enter password
- Enter payment information
- Submit

As a guest, I can reset my password from the login screen.
- Click recover link
- Enter email address
- Receive email containing link
- Click link
- Arrive at password reset page
- Enter password and confirmation
- Password changed

# New accounts

As a new account manager, I receive a verification email when I create an account.

As a new account manager, I can click a link in my verification email to verify my email address.

As a new account manager with a verified email, I can log in.

As a new account manager, I can create subscription to access episodes after logging in.
- Set up payment with Stripe

As a new account manager, I receive an email when my payment is processed and my subscription is active.

As a new account manager, I receive immediate access to content after first payment is processed.

# All users

As a user with content access, I will be able to view any current or free episode.

# Account managers

As an account manager, I can log in.

As an account manager, I see current episodes when I log in.

As an account manager, I see a link to account management on every page.

As an account manager, I can see a list of the users on my account.

As an account manager, I can view my current billing status.

As an account manager, I can view my billing history.

As an account manager, I can see progress for users on my account.

As an account manager, I am charged for my subscription each month.
- Same time each month
- Billing date determined by date of account creation

As an account manager, I can cancel my subscription at any time.

As an account manager, I can change my email.

As an account manager, I can view any episode that is current or free.

# Invites

As an account manager, I can invite new users by entering their name and email address.
- Visit account management page
- Click "New User"
- Enter name and email address
- Submit
- Email invitation sent to address

As an account manager, I receive an email notification when I invite a new user.

As an invitee, I can click link in invitation email to set up account.
- Open email
- Click link in email
- Arrive at new account page
- New account page includes information about parent account
- Fill in account information
- Submit
- Account immediately created, redirect to home screen (current episodes)

As an account manager, I receive an email when someone registers on my account.
- Email sent after success registration via invitation
- Email contains link to account management page

# Members

As a member, I can log in.

As a member, I see current episodes when I log in.

As a member, I can view any episode that is current or free.

As a member, I can see my progress through episodes.

# Admin

As an admin, I can create and edit episodes.

As an admin, I can set a publish date for a episode to have the episode automatically added to current episodes on that date.

As an admin, I can set an expiration date for a episode to have the episode automatically removed from current episodes on that date.

As an admin, I can publish any episode to have it immediately added to current episodes.

As an admin, I can unpublish any current episode to have it immediately removed from current episodes.

As an admin, I can mark episodes as free to allow access to all users and guests.

As an admin, I can create and edit videos.
- Enter title and description
- Associate with episodes
- Upload to Vimeo

As an admin, I can create and edit audio.
- Enter title and description
- Associate with episodes
- Upload to S3

As an admin, I can create and edit a file resource.
- E.g., pdf, doc
- Enter title and description
- Associate with episodes
- Upload to S3

As an admin, I can create and edit a link resource.
- Enter title, description, url
- Associate with episodes

As an admin, I can create and edit recommended readings.
- Enter title, description
- Enter amazon link
- Associate with episodes
- Referral added to amazon link on save if not already present

As an admin, I can create and edit articles using a wysiwyg html editor.
- Enter title, description
- Edit html using editor
- Associate with episodes

As an admin, I can add existing content to episodes.
- Videos, audio, links, uploaded articles, recommended reading
- Visit episode
- Click 'Add video'
- Click 'Existing video'
- Choose from existing videos

As an admin, I can create new content for a episode.
- Visit episode
- Click 'Add video'
- Click 'New video'
- Taken to video creation form
- When video saved, returned to episode

# Accounts

User
  email: string
  crypted_password: string
  account_id: int
  account_owner: bool
  active_until: datetime
  subscription_id: string
  customer_id: string
  confirmation_token: string
  confirmed_at: datetime

Click 'Sign up'
/registrations/new
Enter email and password
/Send email with verification token
Click verify
/Set customer as verified
/subscriptions/new
Click 'Subscribe'
/Stripe checkout
Fill in information and click pay 80
/subscriptions POST
/create stripe customer
/redirect /

/organizations
Create organization account
/organizations/new
Enter organization information, email and password
/Send email with verification token
Click verify
/Set user as verified
/organization/subscriptions/new
Click 'Subscribe'
/Stripe checkout
Fill in information and click pay 400
/organizations/subscriptions POST
/create stripe customer
/redirect /account

/account
Click invite new user
/invitations/new
Enter email, submit
/invitations POST
/create user
/send email invitation to user
/account

Click accept
/Set customer as verified
/subscriptions/new
Click 'Subscribe'
/Stripe checkout
Fill in information and click pay 12
/subscriptions POST
/create stripe customer
/redirect /

# episodes

/episodes
Current Episode
Upcoming Episode


# content

Link
  title
  type: 'Movie', 'Reading'

Image
  social_media
