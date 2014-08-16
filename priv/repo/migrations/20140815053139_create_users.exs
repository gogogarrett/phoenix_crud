defmodule PingPong.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    "CREATE TABLE users(id serial primary key, content varchar(140))"
  end

  def down do
    "DROP TABLE users"
  end

end
