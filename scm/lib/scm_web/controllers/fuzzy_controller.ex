defmodule ScmWeb.FuzzyController do
  use ScmWeb, :controller

  alias Scm.Service.MatrixFuzzy, as: MatrixFuzzyService

  action_fallback(ScmWeb.FallbackController)

  def gen_aggregate_fuzzy(conn, _args) do
    MatrixFuzzyService.generate_matrix_fuzzy()
    MatrixFuzzyService.gen_normalize_matrix_fuzzy()

    crit =
      MatrixFuzzyService.render_data_matrix_fuzzy_criteria()
      |> IO.inspect()
      |> Enum.map(fn itm ->
        %{
          type: itm.type,
          aggregate_value: itm.aggregate_value,
          nor_aggregate_value: itm.nor_aggregate_value,
          supplier_name: itm.supplier.name,
          criteria_name: itm.criteria.name,
          supplier_id: itm.supplier_id,
          criteria_id: itm.criteria_id,
          id: itm.id
        }
      end)

    supp =
      MatrixFuzzyService.render_data_matrix_fuzzy()
      |> IO.inspect()
      |> Enum.map(fn itm ->
        %{
          type: itm.type,
          aggregate_value: itm.aggregate_value,
          nor_aggregate_value: itm.nor_aggregate_value,
          supplier_name: itm.supplier.name,
          criteria_name: itm.criteria.name,
          supplier_id: itm.supplier_id,
          criteria_id: itm.criteria_id,
          id: itm.id
        }
      end)

    json(conn, %{data: %{crit_weight: crit, supp_weight: supp}})
  end

  def gen_fnis_fpis(conn, _args) do
    supplier_id = [1, 2]
    MatrixFuzzyService.handle_fpis_fnis()

    data =
      supplier_id
      |> Enum.reduce([], fn itm, acc ->
        matrix_fuzzy =
          MatrixFuzzyService.get_data_ranking(itm)
          |> Enum.map(fn itm ->
            %{
              fnis: itm.fnis,
              fpis: itm.fpis,
              supplier_name: itm.supplier.name,
              criteria_name: itm.criteria.name
            }
          end)

        acc ++ matrix_fuzzy
      end)

    json(conn, %{data: data})
  end

  def ranking_criteria(conn, _args) do
    supplier_id = [1, 2]

    data =
      Enum.map(supplier_id, fn itm ->
        supp = MatrixFuzzyService.get_supplier(itm)

        sum_fpis =
          MatrixFuzzyService.get_data_ranking(itm)
          |> IO.inspect()
          |> Enum.reduce([], fn itm, acc ->
            acc ++ [itm.fpis]
          end)
          |> Enum.sum()

        sum_fnis =
          MatrixFuzzyService.get_data_ranking(itm)
          |> Enum.reduce([], fn itm, acc ->
            acc ++ [itm.fnis]
          end)
          |> Enum.sum()

        %{
          sum_fnis: sum_fnis,
          sum_fpis: sum_fpis,
          supplier_name: supp.name
        }
      end)
      |> Enum.map(fn itm ->
        %{
          point_of_supplier: itm.sum_fnis / (itm.sum_fpis + itm.sum_fnis),
          supplier_name: itm.supplier_name
        }
      end)
      |> IO.inspect()

    json(conn, %{data: data})
  end
end
