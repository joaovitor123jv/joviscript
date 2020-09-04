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
    IO.puts("Solicitando a execução do analisador lexico")

    IO.inspect Joviscript.Dfa.create(
      MapSet.new(['Q0', 'Q1', 'Q2']),
      MapSet.new(['a', 'b', 'c']),
      %{
        Q0: [{'a', 'Q0'}, {'b', 'Q1'}, {'c', 'Q1'}],
        Q1: [{'a', 'Q1'}, {'b', 'Q2'}, {'c', 'Q1'}],
        Q2: [{'a', 'Q0'}, {'b', 'Q1'}, {'c', 'Q2'}]
      },
      'Q0',
      MapSet.new(['Q1', 'Q2'])
    )


    LexicalAnalyzer.start(files) 
  end

  def run([head | tail]) do
    IO.puts("head = #{head}")
    IO.puts("tail = #{tail}")
  end
end
