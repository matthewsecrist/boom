defmodule Boom do
  @moduledoc """
  `Boom` is inspired by the NodeJS package `@hapi/boom`

  It allows you to respond with json errors easily.
  """

  alias Boom.Errors

  Enum.each(Errors.list(), fn {type, {status_code, message}} ->
    @spec unquote(type)(Plug.Conn.t(), String.t() | nil) :: Plug.Conn.t()
    @doc """
      Responds with #{status_code} - #{message}
    """
    def unquote(:"#{type}")(conn, message \\ nil) do
      boom(conn, unquote(type), message)
    end
  end)

  defp boom(conn, type, message) do
    {status_code, error} = Errors.get_error_for(type)

    body = serialize_body(status_code, error, message)

    conn
    |> Plug.Conn.put_resp_content_type("application/json")
    |> Plug.Conn.send_resp(status_code, body)
    |> Plug.Conn.halt()
  end

  defp serialize_body(500, error, _) do
    Jason.encode!(%{
      statusCode: 500,
      error: error,
      message: "An internal server error occurred."
    })
  end

  defp serialize_body(status_code, error, message) do
    Jason.encode!(%{
      statusCode: status_code,
      error: error,
      message: message
    })
  end
end
