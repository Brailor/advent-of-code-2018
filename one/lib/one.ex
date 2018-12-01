defmodule One do

  def read_input path do
    {status, content} = File.read(path)

    case status do
      :ok -> format_input(content)
      :error -> IO.puts("Cant read file!")
   end
  end

  def format_input string do
    values = string |> String.split

    result = Enum.reduce(values, 0, fn curr, res ->
        res + String.to_integer(curr)
      end)
    IO.inspect result
  end
end

One.read_input "lib/input.txt"
