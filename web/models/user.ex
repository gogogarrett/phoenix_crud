defmodule PhoenixCrud.User do
  use Ecto.Model

  validate user,
     content: present()

  schema "users" do
    field :content, :string
  end
end
