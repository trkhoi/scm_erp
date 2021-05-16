defmodule Scm.Service.MatrixFuzzy do
  import Ecto.Query, warn: false
  alias Scm.Repo
  import Math
  alias Scm.Schema.{MatrixFuzzy, DmSupplier, Criteria, Supplier}

  def all_criteria() do
    Criteria
    |> select([c], c.id)
    |> Repo.all()
  end

  def get_supplier(id) do
    Supplier
    |> select([s], s)
    |> where([s], s.id == ^id)
    |> Repo.one()
  end

  def render_data_matrix_fuzzy_criteria() do
    MatrixFuzzy
    |> select([mf], mf)
    |> where(
      [mf],
      not is_nil(mf.supplier_id) and not is_nil(mf.criteria_id) and mf.type == "criteria"
    )
    |> preload([:supplier, :criteria])
    |> Repo.all()
  end

  def render_data_matrix_fuzzy() do
    MatrixFuzzy
    |> select([mf], mf)
    |> where(
      [mf],
      not is_nil(mf.supplier_id) and not is_nil(mf.criteria_id) and mf.type == "supplier"
    )
    |> preload([:supplier, :criteria])
    |> Repo.all()
  end

  def get_data_ranking(supplier_id) do
    MatrixFuzzy
    |> select([mf], mf)
    |> where(
      [mf],
      mf.supplier_id == ^supplier_id and mf.type == "criteria"
    )
    |> preload([:supplier, :criteria])
    |> Repo.all()
  end

  def get_dm_supplier(supplier_id, criteria_id) do
    DmSupplier
    |> select([ds], ds)
    |> where(
      [ds],
      ds.supplier_id == ^supplier_id and ds.criteria_id == ^criteria_id and ds.type == "supplier"
    )
    |> preload([:supplier, :criteria])
    |> Repo.all()
  end

  def get_matrix_fuzzy_criteria(criteria_id) do
    MatrixFuzzy
    |> select([mf], mf)
    |> where(
      [mf],
      is_nil(mf.supplier_id) and mf.criteria_id == ^criteria_id and mf.type == "criteria"
    )
    |> preload([:supplier, :criteria])
    |> Repo.one()
  end

  def get_matrix_fuzzy_criteria_nor(criteria_id, supplier_id) do
    MatrixFuzzy
    |> select([mf], mf)
    |> where(
      [mf],
      mf.supplier_id == ^supplier_id and mf.criteria_id == ^criteria_id and mf.type == "criteria"
    )
    |> preload([:supplier, :criteria])
    |> Repo.one()
  end

  def get_matrix_fuzzy(supplier_id, criteria_id) do
    MatrixFuzzy
    |> select([mf], mf)
    |> where(
      [mf],
      mf.supplier_id == ^supplier_id and mf.criteria_id == ^criteria_id and mf.type == "supplier"
    )
    |> preload([:supplier, :criteria])
    |> Repo.one()
  end

  def get_dm_supplier_criteria(criteria_id) do
    DmSupplier
    |> select([ds], ds)
    |> where(
      [ds],
      ds.criteria_id == ^criteria_id and ds.type == "criteria"
    )
    |> preload([:supplier, :criteria])
    |> Repo.all()
  end

  def get_max_value(a, b) do
    case a >= b do
      true -> a
      false -> b
    end
  end

  def get_min_value(a, b) do
    case a <= b do
      true -> a
      false -> b
    end
  end

  def create_matrix_fuzzy(attrs) do
    %MatrixFuzzy{}
    |> MatrixFuzzy.changeset(attrs)
    |> Repo.insert()
  end

  def update_matrix_fuzzy(matrix_fuzzy = %{}, attrs) do
    matrix_fuzzy
    |> MatrixFuzzy.changeset(attrs)
    |> Repo.update()
  end

  def generate_matrix_fuzzy() do
    supplier_id = [1, 2]
    dm_id = [1, 2]

    # add aggregate value to fuzzy matrix of supplier
    Enum.reduce(supplier_id, [], fn itm, acc ->
      all_criteria()
      |> Enum.map(fn crit ->
        dmss = get_dm_supplier(itm, crit)
        dms_1 = Enum.at(dmss, 0)
        dms_2 = Enum.at(dmss, 1)
        value_1 = get_min_value(Enum.at(dms_1.value, 0), Enum.at(dms_2.value, 0))
        value_3 = get_max_value(Enum.at(dms_1.value, 2), Enum.at(dms_2.value, 2))
        value_2 = (Enum.at(dms_1.value, 1) + Enum.at(dms_2.value, 1)) / 2.0
        aggregate_value = [value_1] ++ [value_2] ++ [value_3]

        %{
          criteria_id: crit,
          supplier_id: itm,
          type: "supplier",
          aggregate_value: aggregate_value
        }
        |> create_matrix_fuzzy()
      end)
    end)

    # add aggregate value to fuzzy matrix of supplier

    all_criteria()
    |> Enum.map(fn crit ->
      dmss = get_dm_supplier_criteria(crit)
      dms_1 = Enum.at(dmss, 0)
      dms_2 = Enum.at(dmss, 1)

      value_1 = get_min_value(Enum.at(dms_1.value, 0), Enum.at(dms_2.value, 0))
      value_3 = get_max_value(Enum.at(dms_1.value, 2), Enum.at(dms_2.value, 2))
      value_2 = (Enum.at(dms_1.value, 1) + Enum.at(dms_2.value, 1)) / 2.0
      aggregate_value = [value_1] ++ [value_2] ++ [value_3]

      %{
        criteria_id: crit,
        type: "criteria",
        aggregate_value: aggregate_value
      }
      |> create_matrix_fuzzy()
    end)
  end

  def gen_normalize_matrix_fuzzy() do
    supplier_id = [1, 2]

    # add aggregate value to fuzzy matrix of supplier
    Enum.reduce(supplier_id, [], fn itm, acc ->
      all_criteria()
      |> Enum.map(fn crit ->
        mf = get_matrix_fuzzy(itm, crit)
        max_value = Enum.max(mf.aggregate_value)
        value_1 = Enum.at(mf.aggregate_value, 0) / max_value
        value_2 = Enum.at(mf.aggregate_value, 1) / max_value
        value_3 = Enum.at(mf.aggregate_value, 2) / max_value
        nor = [value_1] ++ [value_2] ++ [value_3]

        attrs = %{
          nor_aggregate_value: nor
        }

        update_matrix_fuzzy(mf, attrs)
      end)
    end)

    Enum.reduce(supplier_id, [], fn itm, acc ->
      all_criteria()
      |> Enum.map(fn crit ->
        supplier_mf = get_matrix_fuzzy(itm, crit)
        criteria_mf = get_matrix_fuzzy_criteria(crit)

        max_value = Enum.max(supplier_mf.aggregate_value)

        value_1 =
          Enum.at(supplier_mf.nor_aggregate_value, 0) *
            Enum.at(criteria_mf.aggregate_value, 0)

        value_2 =
          Enum.at(supplier_mf.nor_aggregate_value, 1) *
            Enum.at(criteria_mf.aggregate_value, 1)

        value_3 =
          Enum.at(supplier_mf.nor_aggregate_value, 2) *
            Enum.at(criteria_mf.aggregate_value, 2)

        nor = [value_1] ++ [value_2] ++ [value_3]

        %{
          criteria_id: crit,
          supplier_id: itm,
          type: "criteria",
          nor_aggregate_value: nor
        }
        |> create_matrix_fuzzy()
      end)
    end)
  end

  def handle_fpis_fnis() do
    supplier_id = [1, 2]

    Enum.reduce(supplier_id, [], fn itm, acc ->
      all_criteria()
      |> Enum.map(fn crit ->
        mf = get_matrix_fuzzy_criteria(crit)
        mf_nor = get_matrix_fuzzy_criteria_nor(crit, itm)

        aggregate_value = mf.aggregate_value
        nor = mf_nor.nor_aggregate_value
        fpis_para = Enum.max(aggregate_value)
        fnis_para = Enum.min(nor)

        # cal fpis
        value_1 = Math.pow(Enum.at(nor, 0) - fpis_para, 2)
        value_2 = Math.pow(Enum.at(nor, 1) - fpis_para, 2)
        value_3 = Math.pow(Enum.at(nor, 2) - fpis_para, 2)

        fpis = Math.sqrt(1 / 3 * (value_1 + value_2 + value_3))

        # cal fnis
        value_1_fnis = Math.pow(Enum.at(nor, 0) - fnis_para, 2)
        value_2_fnis = Math.pow(Enum.at(nor, 1) - fnis_para, 2)
        value_3_fnis = Math.pow(Enum.at(nor, 2) - fnis_para, 2)

        fnis = Math.sqrt(1 / 3 * (value_1_fnis + value_2_fnis + value_3_fnis))

        update_matrix_fuzzy(mf_nor, %{fpis: fpis, fnis: fnis})
      end)
    end)
  end
end
