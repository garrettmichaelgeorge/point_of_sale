defmodule POS.CrystalfontzClient do
  @base_url "http://localhost:9393"
  @display_path "/display"
  @display_url @base_url <> @display_path
  @request_uri URI.parse(@base_url <> @display_path)

  def post_message(message) do
    :httpc.request(:post, {@display_url, [], 'application/json', post_body(message)}, [], [])
  end

  defp post_body(message) do
    %{text: message}
    |> Jason.encode!()
    |> String.to_charlist()
  end
end
