defmodule BoomTest do
  use ExUnit.Case
  use Plug.Test
  doctest Boom

  alias Boom.Errors

  Enum.each(Errors.list(), fn {type, {status_code, error}} ->
    @error_type type
    @status_code status_code
    @error error

    test "for #{error}" do
      conn = apply(Boom, unquote(:"#{@error_type}"), [conn(:get, "/foo/bar")])

      assert conn.state == :sent
      assert conn.status == @status_code

      response = Jason.decode!(conn.resp_body)

      assert response["error"] == @error
      assert response["statusCode"] == @status_code

      assert response["message"] ==
               if(@status_code == 500,
                 do: "An internal server error occurred.",
                 else: nil
               )
    end

    test "for #{error} with message" do
      conn = apply(Boom, unquote(:"#{@error_type}"), [conn(:get, "/foo/bar"), "mock"])

      assert conn.state == :sent
      assert conn.status == @status_code

      response = Jason.decode!(conn.resp_body)

      assert response["error"] == @error
      assert response["statusCode"] == @status_code

      assert response["message"] ==
               if(@status_code == 500,
                 do: "An internal server error occurred.",
                 else: "mock"
               )
    end
  end)
end
