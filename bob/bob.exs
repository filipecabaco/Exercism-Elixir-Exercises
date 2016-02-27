defmodule Bob do
  def hey(input) do
    cond do
      silence?(input)  -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shout?(clean(input))-> "Whoa, chill out!"
      true -> "Whatever."  
    end
  end
  
  defp clean(input) , do: String.replace(input, ~r/[0-9]|\s|\W/ , "")
  
  defp shout?("") , do: false
  
  defp shout?(input) , do: String.upcase(input) == input
       
  defp silence?(input) , do: String.lstrip(input) == "" 
  
  defp question?(input) , do: String.ends_with?(input,"?") 
  
end
