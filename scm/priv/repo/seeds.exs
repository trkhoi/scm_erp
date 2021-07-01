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
  SalesForecast,
  FunctionalArea,
  FunctionalAreaFeature,
  ProcedureFlow,
  NewHistoricalData,
  ForecastParameter,
  AdditiveHistoricalData,
  AnalyzeSocialNetwork,
  AffectingFactor,
  ProductIngredient,
  Weight,
  Supplier,
  Criteria,
  DmSupplier,
  Dm,
  Status,
  Solution,
  Inventory,
  SupplierStatus,
  NewBom,
  Likelihood,
  Consequence,
  Risk,
  Solutions,
  RiskSolution,
  IngredientPrice
}

Repo.insert!(%Inventory{
  type: "Sugar",
  maximum_quantity: 10000.0,
  quantity: 120.0
})

Repo.insert!(%Inventory{
  type: "Flour",
  maximum_quantity: 10000.0,
  quantity: 90.0
})

Repo.insert!(%Inventory{
  type: "Bean",
  maximum_quantity: 10000.0,
  quantity: 115.0
})

Repo.insert!(%Inventory{
  type: "Egg",
  maximum_quantity: 10000.0,
  quantity: 88.0
})

Repo.insert!(%Inventory{
  type: "Young rice",
  maximum_quantity: 10000.0,
  quantity: 120.0
})

Repo.insert!(%Solution{
  solution: "Move to second supplier",
  type: "change_supplier"
})

Repo.insert!(%Solution{
  solution: "Use substitute component",
  type: "substitute"
})

Repo.insert!(%Solution{
  solution: "Order extra inventory",
  type: "extra_inventory"
})

Repo.insert!(%Solution{
  solution: "Order 20% material from second supplier and wait for main supplier",
  type: "temporary"
})

Repo.insert!(%Status{
  info: "sample status",
  status: "ok",
  status_name: "OK"
})

Repo.insert!(%Status{
  info: "sample status",
  status: "dead",
  status_name: "Supplier Collapse"
})

Repo.insert!(%Status{
  info: "sample status",
  status: "pre_dead",
  status_name: "Supplier Struggle"
})

Repo.insert!(%Status{
  info: "sample status",
  status: "maintain",
  status_name: "Supplier Maintain"
})

Repo.insert!(%Status{
  info: "sample status",
  status: "lack_of_time",
  status_name: "Supplier Delay Delivery"
})

Repo.insert!(%AnalyzeSocialNetwork{
  name: "Covid-19 pandemic",
  type: "covid",
  most_use_product: ["toilet_paper", "medicine", "water", "food"]
})

Repo.insert!(%AffectingFactor{
  type: "covid",
  name: "Covid-19 pandemic",
  level: "high",
  analyze_social_network_id: 1,
  forecasting_type: ["multiplicative", "additive"]
})

# seed admin
Repo.insert!(%ForecastParameter{
  alpha: 0.5,
  beta: 0.5,
  gamma: 0.5,
  seasonal_cycle: 4,
  forecast_type: "multiplicative"
})

Repo.insert!(%ForecastParameter{
  alpha: 0.5,
  beta: 0.5,
  gamma: 0.5,
  seasonal_cycle: 4,
  forecast_type: "additive"
})

Repo.insert!(%Sales{
  type: "lunar_cake",
  title: "Báo cáo bánh trung thu năm 2020",
  year: 2020,
  description: "sample description"
})

Repo.insert!(%Sales{
  type: "pia_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description"
})

Repo.insert!(%Sales{
  type: "su_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description"
})

Repo.insert!(%Sales{
  type: "green_cake",
  title: "Báo cáo bánh táo năm 2020",
  year: 2020,
  description: "sample description"
})

Repo.insert!(%Product{
  name: "Bánh trung thu hạt sen",
  code: "lunar_cake",
  note: "sample description",
  price: 40_000.0,
  sales_id: 1,
  feature: "forecasting"
})

Repo.insert!(%Product{
  name: "Bánh pía",
  code: "pia_cake",
  note: "sample description",
  price: 45_000.0,
  sales_id: 2
})

Repo.insert!(%Product{
  name: "Bánh su",
  code: "su_cake",
  note: "sample description",
  price: 50_000.0,
  sales_id: 3
})

Repo.insert!(%Product{
  name: "Bánh đậu xanh",
  code: "green_cake",
  note: "sample description",
  price: 40_000.0,
  sales_id: 4
})

Repo.insert!(%Product{
  name: "Bánh trung thu",
  code: "lunar_cake",
  note: "sample description",
  price: 40_000.0,
  sales_id: 1
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

Repo.insert!(%ProductPlan{
  month: 1,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 2,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 3,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 4,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 5,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 6,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 7,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 8,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 9,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 10,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 11,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 12,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "pia_cake"
})

Repo.insert!(%ProductPlan{
  month: 1,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 2,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 3,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 4,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 5,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 6,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 7,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 8,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 9,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 10,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 11,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 12,
  year: 2021,
  quantity: Enum.random(1200..1400),
  product_type: "su_cake"
})

Repo.insert!(%ProductPlan{
  month: 1,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 2,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 3,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 4,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 5,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 6,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 7,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 8,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 9,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 10,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 11,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
})

Repo.insert!(%ProductPlan{
  month: 12,
  year: 2021,
  quantity: Enum.random(500..650),
  product_type: "green_cake"
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
  product_id: 2,
  sop_id: 2,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột pía",
  quantity: 400,
  resource_parent: 2,
  resource_type: "Pia Cake",
  type: "powder"
})

Repo.insert!(%SopComponent{
  product_id: 2,
  sop_id: 2,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Đường",
  quantity: 400,
  resource_parent: 2,
  resource_type: "Pia Cake",
  type: "sugar"
})

Repo.insert!(%SopComponent{
  product_id: 2,
  sop_id: 2,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Trứng",
  quantity: 400,
  resource_parent: 2,
  resource_type: "Pia Cake",
  type: "egg"
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
  product_id: 3,
  sop_id: 3,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột su",
  quantity: 400,
  resource_parent: 3,
  resource_type: "Su Cake",
  type: "powder"
})

Repo.insert!(%SopComponent{
  product_id: 3,
  sop_id: 3,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Muối",
  quantity: 400,
  resource_parent: 3,
  resource_type: "Su Cake",
  type: "salt"
})

Repo.insert!(%SopComponent{
  product_id: 3,
  sop_id: 3,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Kem",
  quantity: 400,
  resource_parent: 3,
  resource_type: "Su Cake",
  type: "cream"
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
  product_id: 4,
  sop_id: 4,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột đậu",
  quantity: 400,
  resource_parent: 4,
  resource_type: "Green Cake",
  type: "powder"
})

Repo.insert!(%SopComponent{
  product_id: 4,
  sop_id: 4,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Đậu xanh",
  quantity: 400,
  resource_parent: 4,
  resource_type: "Green Cake",
  type: "bean"
})

Repo.insert!(%SopComponent{
  product_id: 4,
  sop_id: 4,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Mè",
  quantity: 400,
  resource_parent: 4,
  resource_type: "Green Cake",
  type: "bean"
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
  product_id: 5,
  sop_id: 5,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột trung thu",
  quantity: 400,
  resource_parent: 5,
  resource_type: "Bánh trung thu thâp cẩm",
  type: "powder"
})

Repo.insert!(%SopComponent{
  product_id: 5,
  sop_id: 5,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Thịt gà",
  quantity: 400,
  resource_parent: 5,
  resource_type: "Bánh trung thu thâp cẩm",
  type: "meat"
})

Repo.insert!(%SopComponent{
  product_id: 5,
  sop_id: 5,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Ớt",
  quantity: 400,
  resource_parent: 5,
  resource_type: "Bánh trung thu thâp cẩm",
  type: "chili"
})

Repo.insert!(%SopComponent{
  product_id: 1,
  sop_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Bột trung thu",
  quantity: 400,
  resource_parent: 1,
  resource_type: "Bánh trung thu hạt sen",
  type: "powder"
})

Repo.insert!(%SopComponent{
  product_id: 1,
  sop_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Đường",
  quantity: 400,
  resource_parent: 1,
  resource_type: "Bánh trung thu hạt sen",
  type: "sugar"
})

Repo.insert!(%SopComponent{
  product_id: 1,
  sop_id: 1,
  from_time: ~U[2021-01-13 00:00:00Z],
  to_time: ~U[2021-01-15 00:00:00Z],
  component: "Hạt sen",
  quantity: 400,
  resource_parent: 1,
  resource_type: "Bánh trung thu hạt sen",
  type: "seed"
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

Repo.insert!(%ProcedureFlow{
  procedure: ["powder", "sugar", "seed", "make", "cook"],
  product_id: 1
})

Repo.insert!(%ProcedureFlow{
  procedure: ["powder", "sugar", "egg", "make"],
  product_id: 2
})

Repo.insert!(%ProcedureFlow{
  procedure: ["powder", "salt", "cream", "make"],
  product_id: 3
})

Repo.insert!(%ProcedureFlow{
  procedure: ["powder", "bean", "sesame", "make"],
  product_id: 4
})

Repo.insert!(%ProcedureFlow{
  procedure: ["powder", "meat", "chili", "make", "run"],
  product_id: 5
})

Repo.insert!(%FunctionalArea{
  functional_type: "powder",
  name: "Máy trộn bột"
})

Repo.insert!(%FunctionalArea{
  functional_type: "sugar",
  name: "Máy quậy đường"
})

Repo.insert!(%FunctionalArea{
  functional_type: "egg",
  name: "Máy đánh trứng"
})

Repo.insert!(%FunctionalArea{
  functional_type: "salt",
  name: "Máy trộn muối"
})

Repo.insert!(%FunctionalArea{
  functional_type: "bean",
  name: "Máy nghiền đậu"
})

Repo.insert!(%FunctionalArea{
  functional_type: "meat",
  name: "Máy xay thịt"
})

Repo.insert!(%FunctionalArea{
  functional_type: "chili",
  name: "Máy xay ớt"
})

Repo.insert!(%FunctionalArea{
  functional_type: "seed",
  name: "Máy trộn mè"
})

Repo.insert!(%FunctionalArea{
  functional_type: "make",
  name: "Máy làm khuôn"
})

Repo.insert!(%FunctionalArea{
  functional_type: "cook",
  name: "Lò nướng bánh"
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Sơ chế bột",
  functional_area_id: 1
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Trộn bột",
  functional_area_id: 1
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Hấp bột",
  functional_area_id: 1
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chọn loại đường",
  functional_area_id: 2
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Nung chảy đường",
  functional_area_id: 2
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Trộn đường",
  functional_area_id: 2
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Đập trứng",
  functional_area_id: 3
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Đánh trứng",
  functional_area_id: 3
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chọn loại muối",
  functional_area_id: 4
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Nung chảy muối",
  functional_area_id: 4
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Trộn muối",
  functional_area_id: 4
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Bóc vỏ đậu",
  functional_area_id: 5
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Luộc đậu",
  functional_area_id: 5
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Nghiền đậu",
  functional_area_id: 5
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Rửa thịt",
  functional_area_id: 6
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Hấp thịt",
  functional_area_id: 6
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Ướp gia vị",
  functional_area_id: 6
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Xay thịt",
  functional_area_id: 6
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chọn loại ớt",
  functional_area_id: 7
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Loại bỏ hột ớt",
  functional_area_id: 7
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Trộn ớt",
  functional_area_id: 7
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chọn loại mè",
  functional_area_id: 8
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Rửa mè",
  functional_area_id: 8
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Trộn mè",
  functional_area_id: 8
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chọn khuôn bánh",
  functional_area_id: 9
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Tiến hành lập khuôn",
  functional_area_id: 9
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chọn nhiệt độ",
  functional_area_id: 10
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Chuẩn bị lò",
  functional_area_id: 10
})

Repo.insert!(%FunctionalAreaFeature{
  feature_name: "Nướng bánh",
  functional_area_id: 10
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2019,
  quantity: 3779,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 1.0095955647167532,
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2019,
  quantity: 3779,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9939583481413036,
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2019,
  quantity: 3779,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9902622787689246,
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2019,
  quantity: 3779,
  description: "sample description",
  baseline: 3517.24,
  trend: 0.0,
  season: 1.0061838083730188,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9902622787689246,
  sales_id: 1
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  forecast_type: "additive",
  new_historical_data_id: 1
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  forecast_type: "additive",
  new_historical_data_id: 2
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  forecast_type: "additive",
  new_historical_data_id: 3
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 3517.24,
  trend: 0.0,
  season: 1.0061838083730188,
  forecast_type: "additive",
  new_historical_data_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 1,
  year: 2020,
  quantity: 3551,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 1,
  year: 2020,
  quantity: 3496,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 1,
  year: 2020,
  quantity: 3483,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 1,
  year: 2020,
  quantity: 3539,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 2,
  year: 2020,
  quantity: 2711,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 2,
  year: 2020,
  quantity: 2767,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 2,
  year: 2020,
  quantity: 2706,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 2,
  year: 2020,
  quantity: 2749,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 3,
  year: 2020,
  quantity: 2143,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 3,
  year: 2020,
  quantity: 2165,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 3,
  year: 2020,
  quantity: 2093,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 3,
  year: 2020,
  quantity: 2188,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 4,
  year: 2020,
  quantity: 2225,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 4,
  year: 2020,
  quantity: 2298,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 4,
  year: 2020,
  quantity: 2241,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 4,
  year: 2020,
  quantity: 2175,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 5,
  year: 2020,
  quantity: 2280,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 5,
  year: 2020,
  quantity: 2265,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 5,
  year: 2020,
  quantity: 2260,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 5,
  year: 2020,
  quantity: 2277,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 6,
  year: 2020,
  quantity: 2301,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 6,
  year: 2020,
  quantity: 2314,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 6,
  year: 2020,
  quantity: 2299,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 6,
  year: 2020,
  quantity: 2391,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 7,
  year: 2020,
  quantity: 2214,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 7,
  year: 2020,
  quantity: 2231,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 7,
  year: 2020,
  quantity: 2189,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 7,
  year: 2020,
  quantity: 2201,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 8,
  year: 2020,
  quantity: 2183,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 8,
  year: 2020,
  quantity: 2191,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 8,
  year: 2020,
  quantity: 2190,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 8,
  year: 2020,
  quantity: 2178,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 9,
  year: 2020,
  quantity: 2214,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 9,
  year: 2020,
  quantity: 2203,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 9,
  year: 2020,
  quantity: 2193,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 9,
  year: 2020,
  quantity: 2212,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 10,
  year: 2020,
  quantity: 1976,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 10,
  year: 2020,
  quantity: 1980,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 10,
  year: 2020,
  quantity: 1969,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 10,
  year: 2020,
  quantity: 1971,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 11,
  year: 2020,
  quantity: 1999,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 11,
  year: 2020,
  quantity: 1994,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 11,
  year: 2020,
  quantity: 1997,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 11,
  year: 2020,
  quantity: 1985,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2020,
  quantity: 3880,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2020,
  quantity: 3875,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2020,
  quantity: 3801,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2020,
  quantity: 3779,
  description: "sample description",
  sales_id: 1
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2019,
  quantity: 512,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 1.0095955647167532,
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2019,
  quantity: 514,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9939583481413036,
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2019,
  quantity: 556,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9902622787689246,
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2019,
  quantity: 571,
  description: "sample description",
  baseline: 553.29,
  trend: 0.0,
  season: 1.0061838083730188,
  baseline_add: 553.29,
  trend_add: 0.0,
  season_add: 1.0061838083730188,
  sales_id: 2
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  forecast_type: "additive",
  new_historical_data_id: 53
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  forecast_type: "additive",
  new_historical_data_id: 54
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  forecast_type: "additive",
  new_historical_data_id: 55
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 3517.24,
  trend: 0.0,
  season: 1.0061838083730188,
  forecast_type: "additive",
  new_historical_data_id: 56
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 2
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2019,
  quantity: 512,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 1.0095955647167532,
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2019,
  quantity: 514,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9939583481413036,
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2019,
  quantity: 556,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9902622787689246,
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2019,
  quantity: 571,
  description: "sample description",
  baseline: 1234.56,
  trend: 0.0,
  season: 1.0061838083730188,
  baseline_add: 1234.56,
  trend_add: 0.0,
  season_add: 1.0061838083730188,
  sales_id: 3
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  forecast_type: "additive",
  new_historical_data_id: 105
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  forecast_type: "additive",
  new_historical_data_id: 106
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  forecast_type: "additive",
  new_historical_data_id: 107
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 3517.24,
  trend: 0.0,
  season: 1.0061838083730188,
  forecast_type: "additive",
  new_historical_data_id: 108
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 1,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 1,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 1,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 1,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 2,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 2,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 2,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 2,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 3,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 3,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 3,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 3,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 4,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 4,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 4,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 4,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 5,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 5,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 5,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 5,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 6,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 6,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 6,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 6,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 7,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 7,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 7,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 7,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 8,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 8,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 8,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 8,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 9,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 9,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 9,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 9,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 10,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 10,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 10,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 10,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 11,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 11,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 11,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 11,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2020,
  quantity: Enum.random(1170..1300),
  description: "sample description",
  sales_id: 3
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2019,
  quantity: 512,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 1.0095955647167532,
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2019,
  quantity: 514,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9939583481413036,
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2019,
  quantity: 556,
  description: "sample description",
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  baseline_add: 0.0,
  trend_add: 0.0,
  season_add: 0.9902622787689246,
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2019,
  quantity: 571,
  description: "sample description",
  baseline: 553.29,
  trend: 0.0,
  season: 1.0061838083730188,
  baseline_add: 553.29,
  trend_add: 0.0,
  season_add: 1.0061838083730188,
  sales_id: 4
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 1.0095955647167532,
  forecast_type: "additive",
  new_historical_data_id: 157
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9939583481413036,
  forecast_type: "additive",
  new_historical_data_id: 158
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 0.0,
  trend: 0.0,
  season: 0.9902622787689246,
  forecast_type: "additive",
  new_historical_data_id: 159
})

Repo.insert!(%AdditiveHistoricalData{
  baseline: 3517.24,
  trend: 0.0,
  season: 1.0061838083730188,
  forecast_type: "additive",
  new_historical_data_id: 160
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 1,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 2,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 3,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 4,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 5,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 6,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 7,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 8,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 9,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 10,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 11,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 1,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 2,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 3,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%NewHistoricalData{
  week: 4,
  month: 12,
  year: 2020,
  quantity: Enum.random(470..650),
  description: "sample description",
  sales_id: 4
})

Repo.insert!(%ProductIngredient{
  name: "flour",
  type: "flour",
  quantity: 300.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "Iye water",
  type: "iye_water",
  quantity: 50.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "Sugar scones",
  type: "sugar_scones",
  quantity: 5.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "Lotus seeds",
  type: "lotus_seeds",
  quantity: 2.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "Sweet potato",
  type: "sweet_potato",
  quantity: 1.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "Meat",
  type: "meat",
  quantity: 10.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "Salt eggs",
  type: "salt_eggs",
  quantity: 50.0,
  product_id: 1
})

Repo.insert!(%ProductIngredient{
  name: "flour",
  type: "flour",
  quantity: 250.0,
  product_id: 2
})

Repo.insert!(%ProductIngredient{
  name: "Iye water",
  type: "iye_water",
  quantity: 72.0,
  product_id: 2
})

Repo.insert!(%ProductIngredient{
  name: "Sugar scones",
  type: "sugar_scones",
  quantity: 7.0,
  product_id: 2
})

Repo.insert!(%ProductIngredient{
  name: "Lotus seeds",
  type: "lotus_seeds",
  quantity: 5.0,
  product_id: 3
})

Repo.insert!(%ProductIngredient{
  name: "Sweet potato",
  type: "sweet_potato",
  quantity: 7.0,
  product_id: 3
})

Repo.insert!(%ProductIngredient{
  name: "Meat",
  type: "meat",
  quantity: 20.0,
  product_id: 3
})

Repo.insert!(%ProductIngredient{
  name: "Salt eggs",
  type: "salt_eggs",
  quantity: 70.0,
  product_id: 3
})

Repo.insert!(%ProductIngredient{
  name: "Iye water",
  type: "iye_water",
  quantity: 110.0,
  product_id: 4
})

Repo.insert!(%ProductIngredient{
  name: "Sugar scones",
  type: "sugar_scones",
  quantity: 10.0,
  product_id: 4
})

Repo.insert!(%ProductIngredient{
  name: "Lotus seeds",
  type: "lotus_seeds",
  quantity: 4.0,
  product_id: 4
})

Repo.insert!(%Criteria{
  name: "Cost",
  code: "C1"
})

Repo.insert!(%Criteria{
  name: "Delivery capabilities",
  code: "C2"
})

Repo.insert!(%Criteria{
  name: "Quality of product",
  code: "C3"
})

Repo.insert!(%Criteria{
  name: "Performance",
  code: "C4"
})

Repo.insert!(%Supplier{
  name: "Tấn Phát",
  info: "A1"
})

Repo.insert!(%Supplier{
  name: "Minh Thuỳ",
  info: "A2"
})

Repo.insert!(%Supplier{
  name: "Hải Nam",
  info: "A3"
})

Repo.insert!(%Supplier{
  name: "Vĩnh Khang",
  info: "A4"
})

Repo.insert!(%Supplier{
  name: "Phương Hoài",
  info: "A5"
})

Repo.insert!(%Supplier{
  name: "Hoài Đức",
  info: "A6"
})

Repo.insert!(%Dm{
  name: "Decision Marker 1",
  info: "DM1"
})

Repo.insert!(%Dm{
  name: "Decision Marker 2",
  info: "DM2"
})

Repo.insert!(%Weight{
  type: "criteria",
  rating: "Very Low",
  rating_code: "VL"
})

Repo.insert!(%Weight{
  type: "criteria",
  rating: "Low",
  rating_code: "L"
})

Repo.insert!(%Weight{
  type: "criteria",
  rating: "Medium",
  rating_code: "M"
})

Repo.insert!(%Weight{
  type: "criteria",
  rating: "High",
  rating_code: "H"
})

Repo.insert!(%Weight{
  type: "criteria",
  rating: "Very High",
  rating_code: "VH"
})

Repo.insert!(%Weight{
  type: "supplier",
  rating: "Very Poor",
  rating_code: "VP"
})

Repo.insert!(%Weight{
  type: "supplier",
  rating: "Poor",
  rating_code: "P"
})

Repo.insert!(%Weight{
  type: "supplier",
  rating: "Fair",
  rating_code: "F"
})

Repo.insert!(%Weight{
  type: "supplier",
  rating: "Good",
  rating_code: "G"
})

Repo.insert!(%Weight{
  type: "supplier",
  rating: "Very Good",
  rating_code: "VG"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 1,
  dm_id: 1,
  value: [3.0, 5.0, 7.0],
  type: "supplier",
  rating_code: "F"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 2,
  dm_id: 1,
  value: [7.0, 9.0, 9.0],
  type: "supplier",
  rating_code: "VG"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 3,
  dm_id: 1,
  value: [1.0, 3.0, 5.0],
  type: "supplier",
  rating_code: "P"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 4,
  dm_id: 1,
  value: [3.0, 5.0, 7.0],
  type: "supplier",
  rating_code: "F"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 1,
  dm_id: 2,
  value: [3.0, 5.0, 7.0],
  type: "supplier",
  rating_code: "F"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 2,
  dm_id: 2,
  value: [7.0, 9.0, 9.0],
  type: "supplier",
  rating_code: "VG"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 3,
  dm_id: 2,
  value: [3.0, 5.0, 7.0],
  type: "supplier",
  rating_code: "F"
})

Repo.insert!(%DmSupplier{
  supplier_id: 1,
  criteria_id: 4,
  dm_id: 2,
  value: [3.0, 5.0, 7.0],
  type: "supplier",
  rating_code: "F"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 1,
  dm_id: 1,
  value: [5.0, 7.0, 9.0],
  type: "supplier",
  rating_code: "G"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 2,
  dm_id: 1,
  value: [5.0, 7.0, 9.0],
  type: "supplier",
  rating_code: "G"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 3,
  dm_id: 1,
  value: [1.0, 3.0, 5.0],
  type: "supplier",
  rating_code: "P"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 4,
  dm_id: 1,
  value: [1.0, 3.0, 5.0],
  type: "supplier",
  rating_code: "P"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 1,
  dm_id: 2,
  value: [5.0, 7.0, 9.0],
  type: "supplier",
  rating_code: "G"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 2,
  dm_id: 2,
  value: [7.0, 9.0, 9.0],
  type: "supplier",
  rating_code: "VG"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 3,
  dm_id: 2,
  value: [1.0, 3.0, 5.0],
  type: "supplier",
  rating_code: "P"
})

Repo.insert!(%DmSupplier{
  supplier_id: 2,
  criteria_id: 4,
  dm_id: 2,
  value: [1.0, 3.0, 5.0],
  type: "supplier",
  rating_code: "P"
})

Repo.insert!(%DmSupplier{
  criteria_id: 1,
  dm_id: 1,
  value: [5.0, 7.0, 9.0],
  type: "criteria",
  rating_code: "H"
})

Repo.insert!(%DmSupplier{
  criteria_id: 2,
  dm_id: 1,
  value: [7.0, 9.0, 9.0],
  type: "criteria",
  rating_code: "VH"
})

Repo.insert!(%DmSupplier{
  criteria_id: 3,
  dm_id: 1,
  value: [7.0, 9.0, 9.0],
  type: "criteria",
  rating_code: "VH"
})

Repo.insert!(%DmSupplier{
  criteria_id: 4,
  dm_id: 1,
  value: [3.0, 5.0, 7.0],
  type: "criteria",
  rating_code: "M"
})

Repo.insert!(%DmSupplier{
  criteria_id: 1,
  dm_id: 2,
  value: [3.0, 5.0, 7.0],
  type: "criteria",
  rating_code: "M"
})

Repo.insert!(%DmSupplier{
  criteria_id: 2,
  dm_id: 2,
  value: [5.0, 7.0, 9.0],
  type: "criteria",
  rating_code: "H"
})

Repo.insert!(%DmSupplier{
  criteria_id: 3,
  dm_id: 2,
  value: [5.0, 7.0, 9.0],
  type: "criteria",
  rating_code: "H"
})

Repo.insert!(%DmSupplier{
  criteria_id: 4,
  dm_id: 2,
  value: [1.0, 3.0, 5.0],
  type: "criteria",
  rating_code: "L"
})

Repo.insert!(%SupplierStatus{
  supplier_id: 1,
  status_id: 1
})

Repo.insert!(%SupplierStatus{
  supplier_id: 2,
  status_id: 1
})

Repo.insert!(%SupplierStatus{
  supplier_id: 3,
  status_id: 2
})

Repo.insert!(%SupplierStatus{
  supplier_id: 4,
  status_id: 4
})

Repo.insert!(%SupplierStatus{
  supplier_id: 5,
  status_id: 3
})

Repo.insert!(%SupplierStatus{
  supplier_id: 6,
  status_id: 5
})

Repo.insert!(%NewBom{
  product: "Bánh trung thu",
  material: "Sugar",
  quantity: 150.0
})

Repo.insert!(%NewBom{
  product: "Bánh trung thu",
  material: "Flour",
  quantity: 150.0
})

Repo.insert!(%NewBom{
  product: "Bánh trung thu",
  material: "Bean",
  quantity: 210.0
})

Repo.insert!(%NewBom{
  product: "Bánh trung thu",
  material: "Young rice",
  quantity: 210.0
})

Repo.insert!(%NewBom{
  product: "Bánh trung thu",
  material: "Egg",
  quantity: 50.0
})

Repo.insert!(%NewBom{
  product: "Bánh gạo",
  material: "Sugar",
  quantity: 100.0
})

Repo.insert!(%NewBom{
  product: "Bánh gạo",
  material: "Flour",
  quantity: 150.0
})

Repo.insert!(%NewBom{
  product: "Bánh gạo",
  material: "Young rice",
  quantity: 250.0
})

Repo.insert!(%NewBom{
  product: "Bánh quy",
  material: "Sugar",
  quantity: 100.0
})

Repo.insert!(%NewBom{
  product: "Bánh quy",
  material: "Flour",
  quantity: 150.0
})

Repo.insert!(%NewBom{
  product: "Bánh quy",
  material: "Bean",
  quantity: 180.0
})

Repo.insert!(%NewBom{
  product: "Bánh quy",
  material: "Egg",
  quantity: 30.0
})

Repo.insert!(%NewBom{
  product: "Bánh socola",
  material: "Sugar",
  quantity: 80.0
})

Repo.insert!(%NewBom{
  product: "Bánh socola",
  material: "Flour",
  quantity: 180.0
})

Repo.insert!(%NewBom{
  product: "Bánh socola",
  material: "Bean",
  quantity: 220.0
})

Repo.insert!(%NewBom{
  product: "Bánh socola",
  material: "Young rice",
  quantity: 200.0
})

Repo.insert!(%NewBom{
  product: "Bánh quế",
  material: "Sugar",
  quantity: 100.0
})

Repo.insert!(%NewBom{
  product: "Bánh quế",
  material: "Flour",
  quantity: 120.0
})

Repo.insert!(%NewBom{
  product: "Bánh quế",
  material: "Bean",
  quantity: 190.0
})

Repo.insert!(%NewBom{
  product: "Bánh quế",
  material: "Young rice",
  quantity: 200.0
})

Repo.insert!(%Likelihood{
  likelihood: "Very likely",
  level: 4,
  description: "Happens more than once a year in this industry"
})

Repo.insert!(%Likelihood{
  likelihood: "Likely",
  level: 3,
  description: "Happens about once a year in this industry"
})

Repo.insert!(%Likelihood{
  likelihood: "Unlikely",
  level: 2,
  description: "Happens every 10 years or more in this industry"
})

Repo.insert!(%Likelihood{
  likelihood: "Very unlikely",
  level: 1,
  description: "Has only happened once in this industry"
})

Repo.insert!(%Consequence{
  consequence: "Severe",
  level: 4,
  description:
    "Impact likely to cause business to stop trading or significant financial losses felt"
})

Repo.insert!(%Consequence{
  consequence: "High",
  level: 3,
  description: "Major impact on your business with large financial loss"
})

Repo.insert!(%Consequence{
  consequence: "Moderate",
  level: 2,
  description: "Moderate impact on your business with some financial loss"
})

Repo.insert!(%Consequence{
  consequence: "Low",
  level: 1,
  description: "Insignificant impact on your business with minimal financial loss"
})

Repo.insert!(%Consequence{
  consequence: "Low",
  level: 1,
  description: "Insignificant impact on your business with minimal financial loss"
})

Repo.insert!(%Risk{
  risk: "Cháy, hư hỏng thiết bị",
  consequence_id: 4,
  likelihood_id: 3
})

Repo.insert!(%Risk{
  risk: "Công nhân gặp vấn đề sức khoẻ",
  consequence_id: 3,
  likelihood_id: 2
})

Repo.insert!(%Risk{
  risk: "Cạnh tranh thị trường",
  consequence_id: 2,
  likelihood_id: 4
})

Repo.insert!(%Risk{
  risk: "Nguồn năng lượng gặp sự cố",
  consequence_id: 3,
  likelihood_id: 2
})

Repo.insert!(%Solutions{
  info: "",
  solution: "Thuê nhân lực bên ngoài, giảm số lượng sản xuất",
  type: "mechanical"
})

Repo.insert!(%Solutions{
  info: "",
  solution: "Thuê nhân lực bên ngoài, chấp nhận lỗ để duy trì mối quan hệ với khách hàng",
  type: "human"
})

Repo.insert!(%Solutions{
  info: "",
  solution: "Thuê máy móc bên ngoài, giảm số lượng sản xuất",
  type: "mechanical"
})

Repo.insert!(%Solutions{
  info: "",
  solution: "Thuê máy móc bên ngoài, chấp nhận lỗ để duy trì mối quan hệ với khách hàng",
  type: "human"
})

Repo.insert!(%Solutions{
  info: "",
  solution:
    "Giảm số lượng sản xuất, chỉ giao hàng cho các đối tác quen thuộc. Chấp nhận mất order để duy trì mối quan hệ với những khách hàng quen",
  type: "mechanical"
})

Repo.insert!(%IngredientPrice{
  product: "sweet_potato",
  price: 21_000.0
})

Repo.insert!(%IngredientPrice{
  product: "sugar_scones",
  price: 14_000.0
})

Repo.insert!(%IngredientPrice{
  product: "salt_eggs",
  price: 44_000.0
})

Repo.insert!(%IngredientPrice{
  product: "meat",
  price: 185_000.0
})

Repo.insert!(%IngredientPrice{
  product: "lotus_seeds",
  price: 120_000.0
})

Repo.insert!(%IngredientPrice{
  product: "iye_water",
  price: 149_000.0
})

Repo.insert!(%IngredientPrice{
  product: "flour",
  price: 45_000.0
})
