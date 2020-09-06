defmodule Joviscript do
  @moduledoc """
  Documentation for `Joviscript`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Joviscript.hello()
      :ok

  """
  def start(arguments) do
    IO.puts("Hello World!")
    IO.inspect(arguments)
    # :world
  end
end
