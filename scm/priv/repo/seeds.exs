# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Scm.Repo.insert!(%Scm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Scm.Repo
alias Scm.Schema.{Sales, HistoricalData, Product, Market}

# seed admin

Repo.insert!(%Sales{
  type: "lunar_cake",
  title: "Báo cáo bánh trung thu năm 2020",
  year: 2020,
  description: "sample description"
})

Repo.insert!(%Sales{
  type: "apple_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description"
})

Repo.insert!(%HistoricalData{
  month: 1,
  quantity: 3500,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 2,
  quantity: 2700,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 3,
  quantity: 2150,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 4,
  quantity: 2200,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 5,
  quantity: 2270,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 6,
  quantity: 2300,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 7,
  quantity: 2210,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 8,
  quantity: 2185,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 9,
  quantity: 2200,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 10,
  quantity: 1975,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 11,
  quantity: 1990,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 12,
  quantity: 3800,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%HistoricalData{
  month: 1,
  quantity: 1600,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 2,
  quantity: 1550,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 3,
  quantity: 1700,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 4,
  quantity: 1690,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 5,
  quantity: 1570,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 6,
  quantity: 2500,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 7,
  quantity: 2610,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 8,
  quantity: 2585,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 9,
  quantity: 1700,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 10,
  quantity: 1675,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 11,
  quantity: 1590,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%HistoricalData{
  month: 12,
  quantity: 1800,
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%Product{
  name: "Bánh trung thu",
  code: "lunar_cake",
  note: "sample description",
  price: 40_000.0
})

Repo.insert!(%Market{
  company: "Công ty A",
  code: "a_com",
  product_type: "lunar_cake",
  price: 45_000.0
})

Repo.insert!(%Market{
  company: "Công ty B",
  code: "b_com",
  product_type: "lunar_cake",
  price: 50_000.0
})

Repo.insert!(%Market{
  company: "Công ty C",
  code: "c_com",
  product_type: "lunar_cake",
  price: 37_000.0
})
