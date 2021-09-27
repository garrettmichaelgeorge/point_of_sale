defmodule POS.CrystalfontzClientTest do
  use ExUnit.Case, async: true

  alias POS.CrystalfontzClient

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "POST http://localhost:9393/display" do
    test "success: returns success tuple", %{bypass: bypass} do
      Bypass.expect_once(bypass, "POST", "/display", fn conn ->
        Plug.Conn.resp(conn, 200, "")
      end)

      assert {:ok, _} = CrystalfontzClient.post_message("foo", url: endpoint_url(bypass.port))
    end

    test "failure: returns error tuple" do
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/display"
end
