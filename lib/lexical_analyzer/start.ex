defmodule LexicalAnalyzer do
  def categorize_token(token) do
    case token do
      "(if" -> :condition
      "(function" -> :function_definition
      "(const" -> :attribution
      "(+" -> :sum
      "(*" -> :multiplication
      "(-" -> :subtraction
      "(=" -> :equality_comparation
      _ -> :token 
    end
  end

  def categorize_tokens(tokens) do
    IO.puts("Categorizando tokens")

    categorized_tokens = Enum.map(tokens, fn token -> categorize_token(token) end)


    IO.inspect(categorized_tokens)
  end

  def extract_tokens(file_content) do
    IO.puts("Extraindo tokens de uma string")
    String.split(file_content, " ")
  end

  def start([file | _remaining_files]) do
    IO.puts "On: LexicalAnalyzer"
    IO.inspect file

    case File.read(file) do
      {:ok, file_content} -> file_content |> extract_tokens |> categorize_tokens
      {:error, _} -> IO.puts("Failed to read file")
    end
  end
end

