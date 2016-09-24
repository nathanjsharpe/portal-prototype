defmodule V21.EpisodeTest do
  use V21.ModelCase

  alias V21.Episode

  @valid_attrs %{description: "some content", expire_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, free: true, publish_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Episode.changeset(%Episode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Episode.changeset(%Episode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
