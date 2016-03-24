defmodule App.Acceptance.CartTest do
  use ExUnit.Case
  use Hound.Helpers
  hound_session
  alias App.Product
  alias App.Repo

  @upload %Plug.Upload{path: Path.relative_to_cwd("test/files/broom.jpg"), filename: "broom.jpg", content_type: "image/jpg"}

  setup do
    Repo.delete_all(Product)
    {:ok, product} =
      Product.changeset(%Product{}, %{
        name: "Some product",
        description: "Some product description",
        price: Decimal.new("25.20"),
        image: @upload
      }) |> Repo.insert
    {:ok, product: product}
  end

  test "/cart shows empty cart" do
    # We want a route to exist for the cart
    navigate_to "/cart"
    # We'll define the structure we expect the page to have
    # There's a heading
    heading = find_element(:css, "h2")
    # There's also a .cart div, containing a table of line items
    cart = find_element(:css, ".cart")
    cart_table = find_within_element(cart, :css, "table")
    cart_tbody = find_within_element(cart_table, :css, "tbody")
    line_items = find_all_within_element(cart_tbody, :css, "tr")
    assert visible_text(heading) == "Your cart"
    assert length(line_items) == 0
  end
end
