defmodule Tomba.Error do
  @moduledoc """
  Exception struct for Tomba API errors.

  See [Error Handling](https://docs.tomba.io/api/error-handling) for details.

  ## Fields

    * `:message` - Human-readable error description.
    * `:status_code` - HTTP status code (0 if not from an HTTP response).
    * `:response` - Full API error response body, if available.
  """

  @type t :: %__MODULE__{
          message: String.t(),
          status_code: non_neg_integer(),
          response: map() | nil
        }

  defexception [:message, :status_code, :response]

  @impl true
  def message(%__MODULE__{message: message, status_code: 0}), do: message

  def message(%__MODULE__{message: message, status_code: status_code}),
    do: "[#{status_code}] #{message}"
end
