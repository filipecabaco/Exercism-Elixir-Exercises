defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count(l), do:    count(l, 0)
  defp count([], acc), do: acc
  defp count([_|t], acc), do: count(t, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([head|tail], acc), do: reverse(tail, [head|acc])
  
  @spec map(list, (any -> any)) :: list
  def map(l, f), do: reverse(l) |> map(f, [])
  defp map([], _, acc) , do: acc
  defp map([h|t], f, acc), do: map(t, f, [f.(h)|acc]) 
  
  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: reverse(l) |> filter(f, [])
  defp filter([], _, acc), do: acc  
  defp filter([h|t], f, acc) do
    if apply(f,[h]) do
      filter(t, f, [h|acc])
    else
      filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f), do: reduce(t, f.(h,acc), f)
 
  @spec append(list, list) :: list
  def append(a, b), do: reverse(a) |> do_append(b)
  defp do_append(a, []), do: reverse(a)
  defp do_append([] , b), do: b
  defp do_append(a, [h|t]), do: do_append([h|a],t) 

  @spec concat([[any]]) :: [any]
  def concat(ll), do: reduce(ll,[],&(append(&2,&1)))

end
