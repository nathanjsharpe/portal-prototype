defmodule V21.CollectionTest do
  use V21.ModelCase

  alias V21.Collection

  @valid_attrs %{description: "some content", expire_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, free: true, publish_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Collection.changeset(%Collection{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Collection.changeset(%Collection{}, @invalid_attrs)
    refute changeset.valid?
  end
end
