defmodule POS.CrystalfontzClient do
  @base_url "http://localhost:9393"
  @display_path "/display"
  @display_url @base_url <> @display_path
  @request_uri URI.parse(@base_url <> @display_path)

  def post_message(message, opts) do
    url =
      Keyword.get(opts, :url, display_url())
      |> String.to_charlist()

    case do_post_message(message, url) do
      response -> response
    end
  end

  defp do_post_message(message, url) do
    :httpc.request(:post, {url, [], 'application/json', post_body(message)}, [], [])
  end

  defp post_body(message) do
    %{text: message}
    |> Jason.encode!()
    |> String.to_charlist()
  end

  defp display_url do
    @display_url
  end
end
