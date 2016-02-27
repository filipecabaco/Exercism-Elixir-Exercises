defmodule Words do
  def count(sentence) do
    clean_sentence(sentence)
    |> get_words
    |> count(%{})
  end

  defp count([], result), do: result
  
  defp count([head|tail], result), do: count(tail, update(result, head))
  
  defp clean_sentence(sentence), do: String.replace(sentence, "_", " ") |> String.downcase
  
  defp get_words(sentence), do: Regex.scan(~r/[\w|\w-\w]+/u, sentence) |> List.flatten
  
  defp update(result,head), do: Map.update(result, head, 1, &(&1+1))
  
end
