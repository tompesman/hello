defmodule HelloWeb.LayoutView do
  use HelloWeb, :view

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}

  def hostname() do
    {:ok, hostname} = :inet.gethostname()
    hostname
  end
end
