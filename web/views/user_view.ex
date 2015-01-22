defmodule PhoenixCrud.UserView do
  use PhoenixCrud.View
  alias PhoenixCrud.Router

  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end

end
