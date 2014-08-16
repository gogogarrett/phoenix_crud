defmodule PhoenixCrud.UserController do
  use Phoenix.Controller
  use Jazz
  alias PhoenixCrud.Router
  alias PhoenixCrud.User

  def index(conn, _params) do
    render conn, "index", users: Repo.all(User)
  end

  def show(conn, %{"id" => id}) do
    case Repo.get(User, id) do
      user when is_map(user) ->
        render conn, "show", user: user
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def new(conn, _params) do
    render conn, "new"
  end

  def create(conn, %{"user" => %{"content" => content}}) do
    user = Repo.insert(%User{content: content})
    render conn, "show", user: user
  end

  def edit(conn, %{"id" => id}) do
    case Repo.get(User, id) do
      user when is_map(user) ->
        render conn, "edit", user: user
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end

  def update(conn, %{"id" => id, "user" => params}) do
    present_user = Repo.get(User, id)
    fields = [content: params["content"], id: present_user.id]

    user = struct(User, fields)

    case User.validate(user) do
      [] ->
        Repo.update(user)
        # [g] really hacky way to redirect in the client.. (is there a better way?)
        json conn, 201, JSON.encode!(%{location: Router.user_path(id: user.id)})
      errors ->
        json conn, errors: errors
    end
  end

  def destroy(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    case user do
      user when is_map(user) ->
        Repo.delete(user)
        json conn, 200, JSON.encode!(%{location: Router.users_path})
      _ ->
        redirect conn, Router.page_path(page: "unauthorized")
    end
  end
end
