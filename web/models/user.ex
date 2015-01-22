defmodule PhoenixCrud.User do
  use Ecto.Model

  validate user,
    content: present(message: "must be present")

  schema "users" do
    field :content, :string
  end
end
