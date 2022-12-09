# THIS IS A MODULE
defmodule Hello do

  def produs3(a, b, c) do
    a * b * c
  end

  def is_even?(x), do: rem(x, 2) == 0

  def c5e3(days) do
    # Hello
    days * 24 * 60 * 60
  end

  def readFile() do
    File.read("text.txt")
  end

  defp functie_privata do
    IO.puts("Functie Privata")
  end

  def functie_publica do
    functie_privata()
  end

  # ^ - pin operator, nu te lasa sa schimbi valoarea unei variabile

  # citeste de la tastatura un numar
  def read() do
    {age, _} = IO.gets("Give: ") |> Integer.parse()
    age
  end
end
