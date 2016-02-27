defmodule ListOps do

  @spec count(list) :: non_neg_integer
  def count(l), do:    count(l, 0)
  defp count([], r), do: r
  defp count([_|t], r), do: count(t, r + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  defp reverse([], r), do: r
  defp reverse([head|tail], r), do: reverse(tail, [head|r])
  
  @spec map(list, (any -> any)) :: list
  def map(l, f), do: reverse(l) |> map(f, [])
  defp map([], _, r) , do: r
  defp map([h|t], f, r), do: map(t, f, [f.(h)|r]) 
  
  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: reverse(l) |> filter(f,[])
  defp filter([], _, r), do: r  
  defp filter([h|t], f,r) do
    if apply(f,[h]) do
      filter(t, f, [h|r])
    else
      filter(t, f,r)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, f), do: reduce(t, f.(h,acc), f)
 
  @spec append(list, list) :: list
  def append(a, b) do

  end
  
  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
