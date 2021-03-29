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

alias Scm.Schema.{
  Sales,
  HistoricalData,
  Product,
  Market,
  ProductPlan,
  Storage,
  ComponentProduct,
  SopComponent,
  Sop,
  SalesForecast
}

# seed admin

Repo.insert!(%Product{
  name: "Bánh trung thu",
  code: "lunar_cake",
  note: "sample description",
  price: 40_000.0
})

Repo.insert!(%Product{
  name: "Bánh pía",
  code: "pia_cake",
  note: "sample description",
  price: 45_000.0
})

Repo.insert!(%Product{
  name: "Bánh su",
  code: "su_cake",
  note: "sample description",
  price: 50_000.0
})

Repo.insert!(%Product{
  name: "Bánh đậu xanh",
  code: "green_cake",
  note: "sample description",
  price: 40_000.0
})

Repo.insert!(%Sales{
  type: "lunar_cake",
  title: "Báo cáo bánh trung thu năm 2020",
  year: 2020,
  description: "sample description",
  product_id: 1
})

Repo.insert!(%Sales{
  type: "pia_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description",
  product_id: 2
})

Repo.insert!(%Sales{
  type: "su_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description",
  product_id: 3
})

Repo.insert!(%Sales{
  type: "green_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description",
  product_id: 4
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
  quantity: 4010,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 2,
  year: 2021,
  quantity: 3300,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 3,
  year: 2021,
  quantity: 2700,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 4,
  year: 2021,
  quantity: 2270,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 5,
  year: 2021,
  quantity: 2400,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 6,
  year: 2021,
  quantity: 2450,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 7,
  year: 2021,
  quantity: 2300,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 8,
  year: 2021,
  quantity: 2340,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 9,
  year: 2021,
  quantity: 2310,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 10,
  year: 2021,
  quantity: 2100,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 11,
  year: 2021,
  quantity: 2050,
  product_type: "lunar_cake"
})

Repo.insert!(%ProductPlan{
  month: 12,
  year: 2021,
  quantity: 4000,
  product_type: "lunar_cake"
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 1
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 2
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 3
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 4
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 5
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 6
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 7
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 8
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 9
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 10
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 11
})

Repo.insert!(%Storage{
  product_type: "lunar_cake",
  inventory: 3850,
  month: 12
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  promotion: 400,
  month: 1,
  year: 2020,
  forecast_value: 4005.0,
  sales_id: 1
})

Repo.insert!(%Sop{
  month: 1,
  year: 2020,
  capacity: 3850,
  utilization: 0.88,
  sales_id: 1,
  sales_forecast_id: 1,
  resource_type: "Bánh trung thu hạt sen"
})

Repo.insert!(%Sop{
  month: 1,
  year: 2020,
  capacity: 3850,
  utilization: 0.88,
  sales_id: 2,
  resource_type: "Pia Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 2,
  sop_id: 2,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột pía",
  quantity: 400,
  resource_parent: 2,
  resource_type: "Pia Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 2,
  sop_id: 2,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Đường",
  quantity: 400,
  resource_parent: 2,
  resource_type: "Pia Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 2,
  sop_id: 2,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Trứng",
  quantity: 400,
  resource_parent: 2,
  resource_type: "Pia Cake"
})

Repo.insert!(%Sop{
  month: 1,
  year: 2020,
  capacity: 3850,
  utilization: 0.88,
  sales_id: 3,
  resource_type: "Su Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 3,
  sop_id: 3,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột su",
  quantity: 400,
  resource_parent: 3,
  resource_type: "Su Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 3,
  sop_id: 3,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Muối",
  quantity: 400,
  resource_parent: 3,
  resource_type: "Su Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 3,
  sop_id: 3,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Kem",
  quantity: 400,
  resource_parent: 3,
  resource_type: "Su Cake"
})

Repo.insert!(%Sop{
  month: 1,
  year: 2020,
  capacity: 3850,
  utilization: 0.88,
  sales_id: 4,
  resource_type: "Green Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 4,
  sop_id: 4,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột đậu",
  quantity: 400,
  resource_parent: 4,
  resource_type: "Green Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 4,
  sop_id: 4,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Đậu xanh",
  quantity: 400,
  resource_parent: 4,
  resource_type: "Green Cake"
})

Repo.insert!(%SopComponent{
  sales_id: 4,
  sop_id: 4,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Mè",
  quantity: 400,
  resource_parent: 4,
  resource_type: "Green Cake"
})

Repo.insert!(%Sop{
  month: 1,
  year: 2020,
  capacity: 3850,
  utilization: 0.88,
  sales_id: 1,
  resource_type: "Bánh trung thu thâp cẩm"
})

Repo.insert!(%SopComponent{
  sales_id: 1,
  sop_id: 5,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột trung thu",
  quantity: 400,
  resource_parent: 5,
  resource_type: "Bánh trung thu thâp cẩm"
})

Repo.insert!(%SopComponent{
  sales_id: 1,
  sop_id: 5,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Thịt gà",
  quantity: 400,
  resource_parent: 5,
  resource_type: "Bánh trung thu thâp cẩm"
})

Repo.insert!(%SopComponent{
  sales_id: 1,
  sop_id: 5,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Ớt",
  quantity: 400,
  resource_parent: 5,
  resource_type: "Bánh trung thu thâp cẩm"
})

Repo.insert!(%SopComponent{
  sales_id: 1,
  sop_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột trung thu",
  quantity: 400,
  resource_parent: 1,
  resource_type: "Bánh trung thu hạt sen"
})

Repo.insert!(%SopComponent{
  sales_id: 1,
  sop_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Đường",
  quantity: 400,
  resource_parent: 1,
  resource_type: "Bánh trung thu hạt sen"
})

Repo.insert!(%SopComponent{
  sales_id: 1,
  sop_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Hạt sen",
  quantity: 400,
  resource_parent: 1,
  resource_type: "Bánh trung thu hạt sen"
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  promotion: 400,
  month: 1,
  year: 2021,
  forecast_value: 4005.0,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  promotion: 500,
  month: 2,
  year: 2021,
  forecast_value: 3281.0,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  promotion: 450,
  month: 3,
  year: 2021,
  forecast_value: 2664.5,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 4,
  year: 2021,
  forecast_value: 2266.0,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 5,
  year: 2021,
  forecast_value: 2338.1,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 6,
  year: 2021,
  forecast_value: 2369.0,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 7,
  year: 2021,
  forecast_value: 2276.3,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 8,
  year: 2021,
  forecast_value: 2250.55,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 9,
  year: 2021,
  forecast_value: 2266.0,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 10,
  year: 2021,
  forecast_value: 2034.25,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 11,
  year: 2021,
  forecast_value: 2049.7,
  sales_id: 1
})

Repo.insert!(%SalesForecast{
  product_type: "lunar_cake",
  growth: 0.03,
  month: 12,
  year: 2021,
  forecast_value: 3914.0,
  sales_id: 1
})

Repo.insert!(%ComponentProduct{
  product_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "stage 1",
  resource_parent: 2,
  resource_type: "scheduling"
})

Repo.insert!(%ComponentProduct{
  product_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "stage 2",
  resource_parent: 2,
  resource_type: "scheduling"
})

Repo.insert!(%ComponentProduct{
  product_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "stage 3",
  resource_parent: 2,
  resource_type: "scheduling"
})

Repo.insert!(%ComponentProduct{
  product_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "stage 4",
  resource_parent: 2,
  resource_type: "scheduling"
})
