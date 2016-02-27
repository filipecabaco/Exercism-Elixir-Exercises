defmodule Acronym do
  
  @regex ~r/[A-Z]|\s[a-z]/
  
  def abbreviate(string) do
    string
    |> scan_sentence
    |> get_letters([])
    |> prepare_letters([])
    |> acronym
  end
  
  defp scan_sentence(string), do: Regex.scan(@regex, string) |> List.flatten
  
  defp get_letters([],result), do: result
  
  defp get_letters([head|tail],result), do: get_letters(tail, [head|result])

  defp prepare_letters([],result), do: result

  defp prepare_letters([head|tail],result), do: prepare_letters(tail, [prepare_letter(head)|result])

  defp prepare_letter(letter), do: String.upcase(letter) |> String.strip

  defp acronym(letters), do: Enum.reduce(letters, fn (v2,v1) -> v1<>v2 end)
    
end
