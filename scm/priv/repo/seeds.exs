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
alias Scm.Schema.{Sales, HistoricalData, Product, Market, ProductPlan}

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
  sales_id: 1,
  shipment: 220
})

Repo.insert!(%HistoricalData{
  month: 2,
  quantity: 2700,
  description: "sample description",
  sales_id: 1,
  shipment: 230
})

Repo.insert!(%HistoricalData{
  month: 3,
  quantity: 2150,
  description: "sample description",
  sales_id: 1,
  shipment: 210
})

Repo.insert!(%HistoricalData{
  month: 4,
  quantity: 2200,
  description: "sample description",
  sales_id: 1,
  shipment: 220
})

Repo.insert!(%HistoricalData{
  month: 5,
  quantity: 2270,
  description: "sample description",
  sales_id: 1,
  shipment: 290
})

Repo.insert!(%HistoricalData{
  month: 6,
  quantity: 2300,
  description: "sample description",
  sales_id: 1,
  shipment: 300
})

Repo.insert!(%HistoricalData{
  month: 7,
  quantity: 2210,
  description: "sample description",
  sales_id: 1,
  shipment: 295
})

Repo.insert!(%HistoricalData{
  month: 8,
  quantity: 2185,
  description: "sample description",
  sales_id: 1,
  shipment: 287
})

Repo.insert!(%HistoricalData{
  month: 9,
  quantity: 2200,
  description: "sample description",
  sales_id: 1,
  shipment: 190
})

Repo.insert!(%HistoricalData{
  month: 10,
  quantity: 1975,
  description: "sample description",
  sales_id: 1,
  shipment: 195
})

Repo.insert!(%HistoricalData{
  month: 11,
  quantity: 1990,
  description: "sample description",
  sales_id: 1,
  shipment: 185
})

Repo.insert!(%HistoricalData{
  month: 12,
  quantity: 3800,
  description: "sample description",
  sales_id: 1,
  shipment: 200
})

Repo.insert!(%HistoricalData{
  month: 1,
  quantity: 1600,
  description: "sample description",
  sales_id: 2,
  shipment: 350
})

Repo.insert!(%HistoricalData{
  month: 2,
  quantity: 1550,
  description: "sample description",
  sales_id: 2,
  shipment: 340
})

Repo.insert!(%HistoricalData{
  month: 3,
  quantity: 1700,
  description: "sample description",
  sales_id: 2,
  shipment: 360
})

Repo.insert!(%HistoricalData{
  month: 4,
  quantity: 1690,
  description: "sample description",
  sales_id: 2,
  shipment: 375
})

Repo.insert!(%HistoricalData{
  month: 5,
  quantity: 1570,
  description: "sample description",
  sales_id: 2,
  shipment: 380
})

Repo.insert!(%HistoricalData{
  month: 6,
  quantity: 2500,
  description: "sample description",
  sales_id: 2,
  shipment: 355
})

Repo.insert!(%HistoricalData{
  month: 7,
  quantity: 2610,
  description: "sample description",
  sales_id: 2,
  shipment: 360
})

Repo.insert!(%HistoricalData{
  month: 8,
  quantity: 2585,
  description: "sample description",
  sales_id: 2,
  shipment: 365
})

Repo.insert!(%HistoricalData{
  month: 9,
  quantity: 1700,
  description: "sample description",
  sales_id: 2,
  shipment: 700
})

Repo.insert!(%HistoricalData{
  month: 10,
  quantity: 1675,
  description: "sample description",
  sales_id: 2,
  shipment: 710
})

Repo.insert!(%HistoricalData{
  month: 11,
  quantity: 1590,
  description: "sample description",
  sales_id: 2,
  shipment: 675
})

Repo.insert!(%HistoricalData{
  month: 12,
  quantity: 1800,
  description: "sample description",
  sales_id: 2,
  shipment: 680
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

Repo.insert!(%ProductPlan{
  month: 1,
  year: 2021,
  quantity: 3700,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 2,
  year: 2021,
  quantity: 3200,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 3,
  year: 2021,
  quantity: 2500,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 4,
  year: 2021,
  quantity: 2150,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 5,
  year: 2021,
  quantity: 2250,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 6,
  year: 2021,
  quantity: 2300,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 7,
  year: 2021,
  quantity: 2190,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 8,
  year: 2021,
  quantity: 1900,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 9,
  year: 2021,
  quantity: 2300,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 10,
  year: 2021,
  quantity: 2000,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 11,
  year: 2021,
  quantity: 1860,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 12,
  year: 2021,
  quantity: 3800,
  product_type: "lunar_cake"
})
