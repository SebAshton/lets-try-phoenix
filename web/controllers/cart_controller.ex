defmodule App.CartController do
  use App.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end

  def add(conn, params) do
    IO.puts inspect params
    redirect conn, to: cart_path(conn, :show)
  end
end
