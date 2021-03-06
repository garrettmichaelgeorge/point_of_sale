defmodule POS.CrystalfontzClient do
  alias POS.CrystalfontzClientBehaviour

  @behaviour CrystalfontzClientBehaviour

  @base_url "http://localhost:9393"
  @display_path "/display"
  @display_url @base_url <> @display_path

  defp display_url, do: @display_url

  @impl CrystalfontzClientBehaviour
  def display_message(message, opts) do
    url_charlist =
      Keyword.get(opts, :url, display_url())
      |> String.to_charlist()

    with {:ok, {{_protocol, status_code, _msg} = _resp_type, _headers, _} = response}
         when status_code in [200, 201] <- do_display_message(message, url_charlist) do
      {:ok, response}
    else
      _ ->
        {:error, ""}
    end
  end

  defp do_display_message(message, url_charlist) do
    :httpc.request(:post, {url_charlist, [], 'application/json', post_body(message)}, [], [])
  end

  defp post_body(message) do
    %{text: message}
    |> Jason.encode!()
    |> String.to_charlist()
  end
end
