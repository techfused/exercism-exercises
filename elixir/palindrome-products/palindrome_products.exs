defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    for a <- min_factor..max_factor,
        b <- min_factor..max_factor,
        a <= b,
        palindrome?(a * b) do
      [a, b]
    end
    |> Enum.group_by(fn [a,b] -> a * b end)
  end

  defp palindrome?(n) do
    digits = Integer.digits(n)
    digits === Enum.reverse(digits)
  end

end
