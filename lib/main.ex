defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(arguments) do
   Joviscript.start(arguments) 
  end
end
