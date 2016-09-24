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
