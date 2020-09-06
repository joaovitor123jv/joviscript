defmodule LexicalAnalyzer do
  def categorize_token(token) do
    case token do
      "if" -> :condition
      "function" -> :function_definition
      "const" -> :attribution
      "+" -> :sum
      "*" -> :multiplication
      "-" -> :subtraction
      "=" -> :equality_comparation
      "(" -> :function_call
      ")" -> :end_of_scope
      " " -> :trash
      "\n" -> :trash
      "\t" -> :trash
      "" -> :trash
      _ -> :token
    end
  end

  def categorize_tokens(tokens) do
    Enum.map(tokens, fn token -> categorize_token(token) end)
  end

  def extract_tokens(file_content) do
    IO.puts("Extraindo tokens de uma string")

    file_content
    |> String.replace("(", " ( ")
    |> String.replace(")", " ) ")
    |> String.split(" ")
  end

  def clear_tokens(raw_tokens) do
    Enum.filter(raw_tokens, fn token -> token != :trash end)
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
