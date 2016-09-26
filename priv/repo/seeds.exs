# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     V21.Repo.insert!(%V21.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

V21.Repo.insert!(%V21.User{
  email: "admin@cliftonlabs.com",
  confirmed_at: Timex.now,
  admin: true,
  crypted_password: V21.Registration.hashed_password("password")
})
