defmodule PhoenixCrud.UserController do
  use Phoenix.Controller

  def index(conn, _params) do
    users = Repo.all(PhoenixCrud.User)
    render conn, "index", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(PhoenixCrud.User, id)
    case user do
      user when is_map(user) ->
        render conn, "show", user: user
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, params) do
    u = %PhoenixCrud.User{content: params["user"]["content"]}
    user = Repo.insert(u)
    render conn, "show", user: user
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get(PhoenixCrud.User, id)
    case user do
      user when is_map(user) ->
        render conn, "edit", user: user
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def update(conn, %{"id" => id, "user" => params}) do
    present_user = Repo.get(PhoenixCrud.User, id)
    fields = [content: params["content"], id: present_user.id]

    user = struct(PhoenixCrud.User, fields)

    case PhoenixCrud.User.validate(user) do
      [] ->
        Repo.update(user)
        # [g] really hacky way to redirect in the client.. (is there a better way?)
        json conn, 201, "{\"location\": \"#{PhoenixCrud.Router.user_path(id: user.id)}\"}"
      errors ->
        json conn, errors: errors
    end
  end

  def destroy(conn, %{"id" => id}) do
    user = Repo.get(PhoenixCrud.User, id)
    case user do
      user when is_map(user) ->
        Repo.delete(user)
        json conn, 200, "{\"location\": \"#{Router.users_path}\"}"
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end
end
