defmodule AuctionWeb.Api.ItemView do
  use AuctionWeb, :view

  def render("index.json", %{items: items}) do
    %{date: render_many(items, __MODULE__, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{date: render_one(item, __MODULE__, "item.json")}
  end

  def render("item_with_bids.json", %{item: item}) do
    %{
      data: %{
        type: "item",
        id: item.id,
        title: item.title,
        description: item.description,
        ends_at: item.ends_at,
        bids: render_many(item.bids, AuctionWeb.Api.BidView, "bid.json")
      }
    }
  end
end
