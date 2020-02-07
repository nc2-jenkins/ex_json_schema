defmodule ExJsonSchema.Validator.XNullable do
  @moduledoc """
  `ExJsonSchema.Validator` implementation for `"x-nullable"` attributes.

  See:
  https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.5.3
  https://tools.ietf.org/html/draft-wright-json-schema-validation-01#section-6.26
  https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.1
  """

  alias ExJsonSchema.Validator.Error

  @behaviour ExJsonSchema.Validator

  @impl ExJsonSchema.Validator
  def validate(_, _, {"x-nullable", nullable}, data, _) do
    do_validate(nullable, data)
  end

  def validate(_, _, _, _, _) do
    []
  end

  defp do_validate(nullable, data) do
    case {nullable, data} do
      {false, nil} ->
        [
          %Error{
            error: %Error.Type{expected: "Not Null", actual: "Null"},
            path: ""
          }
        ]

      _ ->
        []
    end
  end
end
