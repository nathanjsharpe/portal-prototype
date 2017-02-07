This was a prototype I put together over several evenings to pitch Phoenix as an alternative to Rails for a project my company started in late 2016. We did end up using Rails, but I certainly don't regret trying out Phoenix, albeit briefly. And I think as more people choose Phoenix over Rails, it'll become easier to pitch it as a better alternative.

# V21

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

Episodes
Links

Create new account
  -Confirm email
Invite user
  -Resend invitation
  -Check invitation status
Log in
Recover password

Admin
  email
  password_digest

Account
  user_id (manager)

User
  email
  password_digest
  confirmed
  confirmation_token
  recovery_token
  recovery_expiration
  account_id

Sessions
  user_id

Invitations
  name
  email
  token
  account_id
  expires_at
  accepted_at
  user_id

Registrations

Invite
  /invitations/new
  Enter email and name
  Submit form
  Generate token
  Send email with token link
  Redirect to /invitations/<id>

  /invitations/<id>
  Resend
  Generate new token, reset expires_at
  Send new email

  /invitations/<token>/accept
  Retreive invitation by key
  Hidden fields for email, name, account_id
  Fill in password, password_confirmation
  Submit to invitations#update
  Save user
  Create session
  Update invitation
  Send email to account manager
  Redirect to home page

Register
  /accounts/new
  Enter email, name, password
  Submit POST /accounts -> accounts#create
  Create account
  Create user
  Send confirmation email with token link

Recover password
  /passwords/new
  Enter email
  Set recovery_token, recovery expiration on user
  Send token link to email
  Redirect to sessions/new with flash message

  /passwords/<token>
  Enter password and confirmation
  Submit PUT passwords#update


