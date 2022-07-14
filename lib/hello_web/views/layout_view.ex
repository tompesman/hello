defmodule HelloWeb.LayoutView do
  use HelloWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def hostname() do
    case HTTPoison.get(
           "http://metadata.google.internal/computeMetadata/v1/instance/id",
           [{"Metadata-Flavor", "Google"}]
         ) do
      {:ok, %HTTPoison.Response{body: body}} -> body
      {:error, %HTTPoison.Error{reason: reason}} -> reason
    end
  end
end
