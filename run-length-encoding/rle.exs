defmodule RunLengthEncoder do 
  
  def encode(string) do
    String.graphemes(string)
    |> Enum.reverse
    |> encode_char_list(1,"")
  end

  def encode_char_list([],_,result), do: to_string result

  def encode_char_list([alone],counter,result), do: encode_char_list([],0,"#{counter}#{alone}#{result}")
  
  def encode_char_list([first|tail], counter, result) do
    cond do
      first == hd(tail) -> encode_char_list(tail , counter + 1, result) 
      true -> encode_char_list(tail, 1 , "#{counter}#{first}#{result}")
    end  
  end
  
  @regex ~r/\d+\D/

  def decode(string) do
    string
    |> get_codes
    |> decode_string("") 
  end
  
  def get_codes(string), do: Regex.scan(@regex,string) |> List.flatten
  
  def decode_string([],result) , do: result
  
  def decode_string([head|tail],result) do
    letter=String.last(head)
    quant=String.slice(head, 0..-2) |> String.to_integer
    res = for _ <- 1..quant, do: letter <> ""
    decode_string(tail,"#{result}#{res}")
  end
  
end
