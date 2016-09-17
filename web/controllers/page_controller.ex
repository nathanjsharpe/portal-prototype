defmodule V21.PageController do
  use V21.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
