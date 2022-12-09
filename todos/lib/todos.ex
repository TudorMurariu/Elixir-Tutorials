defmodule Todos do

  # citeste de la tastatura un numar
  defp read_int() do
    IO.puts("Give a number :")
    {age, _} = IO.gets("") |> Integer.parse()
    age
  end

  defp read_todo() do
    IO.puts("Write the todo's text :")
    String.replace(IO.gets(""), "\n", "")
  end

  def main() do
    lista = []
    main(lista)
  end

  defp main(lista) do
    IO.puts("\n------------------------------------------------")
    IO.puts("The commands are :")
    IO.puts("0 - exit")
    IO.puts("1 - add todo")
    IO.puts("2 - remove todo by id")
    IO.puts("3 - update todo by id")
    IO.puts("4 - show all todos")
    IO.puts("5 - remove all todos")
    IO.puts("6 - populate list with ")
    IO.puts("------------------------------------------------\n")

    comanda = read_int()

    cond do
      comanda == 0 -> false
      comanda == 1 -> read_todo() |> add(lista) |> main()
      comanda == 2 -> read_int() |> remove(lista) |> main()
      comanda == 3 -> id = read_int() ; text = read_todo()
        update(id, text, lista) |> main()
      comanda == 4 -> print(lista) ; main(lista)
      comanda == 5 -> remove_all(lista) |> main()
      comanda == 6 -> populate() |> main()
      true -> IO.puts("There is no command with this id") ; main(lista)
    end
  end

  # add
  defp add(text, lista) when lista == [] do
    [{0, text} | lista]
  end

  defp add(text, lista) do
    [{id, _text}| _] = Enum.sort(lista, fn {a,b}, {c,d} -> a < b end)
    [{id+1, text} | lista]
  end

  # remove
  defp remove(id, [{idTodo, text} | tail]) when id == idTodo do
    tail
  end

  defp remove(id, [{idTodo, text} | tail]) do
    [ {idTodo, text} | remove(id, tail) ]
  end

  defp remove(id, []) do
    IO.puts("There is no todo with this id!")
    []
  end

  # update
  defp update(id, text_new, [{idTodo, text} | tail]) when id == idTodo do
    [ {id, text_new} | tail ]
  end

  defp update(id, text_new, [{idTodo, text} | tail]) do
    [ {id, text} | update(id, text_new, tail) ]
  end

  defp update(id, text, []) do
    IO.puts("There is no todo with this id!")
    []
  end

  # print
  defp print([ {id, text} | tail ]) do
    id_str = Integer.to_string(id)
    IO.puts("#{id_str} : #{text}") # sau <>
    print(tail)
  end

  defp print([]) do
    false
  end

  # remove all
  defp remove_all(lista) do
    []
  end

  # populate
  defp populate() do
    [ {0, "Water the plants"}, {1, "Feed the cat"}, {2, "Walk the dog"}, {3, "Buy some food"}, {4, "Buy dog and cat food"}]
  end

  # String.replace("\n", "")
end
