defmodule Mix.Tasks.Start do
  use Mix.Task

  def run([]) do
    IO.puts("Usage: mix start [option]")
    IO.puts("\t   available options:")
    IO.puts("\t\t   - lexical-analyzer [files.jovs]")
  end

  def run([_head | []]) do
    run([])
  end

  def run(["lexical-analyzer" | files]) do
    IO.puts("Requesting lexical-analyzer to run")

    LexicalAnalyzer.start(files)
  end

  def run([head | tail]) do
    IO.puts("head = #{head}")
    IO.puts("tail = #{tail}")
  end
end
