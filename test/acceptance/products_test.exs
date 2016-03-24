defmodule PhoenixCommerce.Acceptance.ProductsTest do
  use ExUnit.Case
  use Hound.Helpers
  hound_session

  test "/products - product details include name, description, and price" do
    {:ok, product} =
      %Product{
        name: "Some product",
        description: "Some product description",
        price: Decimal.new("25.20")
      } |> Repo.insert

    navigate_to "/products"
    product_tr = find_element(:css, ".table tbody tr:first-child")
    name = find_within_element(product_tr, :css, "td:first-child")
    price = find_within_element(product_tr, :css, "td:last-child")
    description = find_within_element(product_tr, :css, "td:nth-of-type(1)")
    assert visible_text(name) == product.name
    assert visible_text(price) == "$#{product.price}"
    assert visible_text(description) == product.description
  end
end