defmodule PhoenixCrud.Repo do
	use Ecto.Repo, 
		otp_app: :phoenix_crud, 
		adapter: Ecto.Adapters.Postgres

	def priv do
		app_dir(:phoenix_crud, "priv/repo")
	end
	
end