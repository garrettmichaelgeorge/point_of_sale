defmodule POS.CrystalfontzClientTest do
  use ExUnit.Case, async: true

  alias POS.CrystalfontzClient

  @crystalfontz_port 9393

  setup do
    bypass = Bypass.open(port: @crystalfontz_port)
    {:ok, bypass: bypass}
  end

  describe "POST http://localhost:9393/display" do
    test "success: returns success tuple", %{bypass: bypass} do
      Bypass.expect_once(bypass, "POST", "/display", fn conn ->
        Plug.Conn.resp(conn, 200, "")
      end)

      assert {:ok, _} = CrystalfontzClient.post_message("foo")
    end

    test "failure: returns error tuple" do
    end
  end
end
