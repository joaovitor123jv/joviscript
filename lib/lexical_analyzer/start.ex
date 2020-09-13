defmodule LexicalAnalyzer do
  def categorize_token(token, recognizer_dfa) do
    category = Joviscript.Dfa.test(recognizer_dfa, token)

    if category == :error do
      IO.puts("OHH GOD, THAT's BAAAD: error")
    end

    category
  end

  def categorize_tokens(tokens) do
    recognizer_dfa = Joviscript.LexicalAnalyzer.Dfa.create()
    Enum.map(tokens, fn token -> categorize_token(token, recognizer_dfa) end)
  end

  def extract_tokens(file_content) do
    IO.puts("Extracting tokens from string")

    file_content
    |> String.replace("\n", " ")
    |> String.replace("\t", " ")
    |> String.replace("(", " ( ")
    |> String.replace(")", " ) ")
    |> String.split(" ")
  end

  def clear_tokens(raw_tokens) do
    Enum.filter(raw_tokens, fn token -> (token != :start) && (token != nil) end)
  end

  def run(file_content) do
    IO.inspect(file_content |> extract_tokens |> categorize_tokens |> clear_tokens)
  end

  def start([file | _remaining_files]) do
    IO.puts("On: LexicalAnalyzer")
    IO.inspect(file)

    case File.read(file) do
      {:ok, file_content} -> run(file_content)
      {:error, _} -> IO.puts("Failed to read file")
    end
  end
end
