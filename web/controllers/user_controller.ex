defmodule PhoenixCrud.UserController do
  use Phoenix.Controller
  
  alias PhoenixCrud.Router
  alias PhoenixCrud.User
  alias PhoenixCrud.Repo

  plug :action

  def index(conn, _params) do
    render conn, "index.html", users: Repo.all(User)
  end

  def show(conn, %{"id" => id}) do
    case Repo.get(User, id) do
      user when is_map(user) ->
        render conn, "show.html", user: user
      _ ->
        redirect conn, to: Router.Helpers.page_path(conn, :show, "unauthorized")
    end
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => %{"content" => content}}) do
    user = %User{content: content}
    case User.validate(user) do
      nil ->
        user = Repo.insert(user)
        render conn, "show.html", user: user
      errors ->
        render conn, "new.html", user: user, errors: errors
    end
  end

  def edit(conn, %{"id" => id}) do
    case Repo.get(User, id) do
      user when is_map(user) ->
        render conn, "edit.html", user: user
      _ ->
        redirect conn, to: Router.Helpers.page_path(conn, :show, "unauthorized")
    end
  end

  def update(conn, %{"id" => id, "user" => params}) do
    user = Repo.get(User, id)
    user = %{user | content: params["content"]}

    case User.validate(user) do
      nil ->
        Repo.update(user)
        # [g] really hacky way to redirect in the client.. (is there a better way?)
        conn 
        |> put_status(201)
        |> json %{location: Router.Helpers.user_path(conn, :show, user.id) }
      errors ->
        json conn, errors: errors
    end
  end

  def destroy(conn, %{"id" => id}) do
    user = Repo.get(User, id)
    case user do
      user when is_map(user) ->
        Repo.delete(user)
        conn
        |> put_status(201)
        |> json %{location: Router.Helpers.user_path(conn, :index)}
      _ ->
        redirect conn, Router.Helpers.page_path(page: "unauthorized")
    end
  end
end