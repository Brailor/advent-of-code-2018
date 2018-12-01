defmodule One do
  def read_input(path) do
    {status, content} = File.read(path)

    case status do
      :ok -> second_occurance(String.split(content))
      :error -> IO.puts("Cant read file!")
    end
  end

  def total_count(string) do
    result =
      Enum.reduce(string, 0, fn curr, res ->
        res + String.to_integer(curr)
      end)

    IO.inspect(result)
  end

  def second_occurance(string, freq \\ 0, freq_map \\ %{0 => 1}) do
    result =
      Enum.reduce_while(string, {freq, freq_map}, fn curr, {freq, freq_map} ->
        freq = freq + String.to_integer(curr)

        cond do
          Map.has_key?(freq_map, freq) -> {:halt, {:succ, freq}}
          true -> {:cont, {freq, Map.put(freq_map, freq, 1)}}
        end
      end)

    case result do
      {:succ, freq} -> IO.inspect("The first match is at frequency: #{freq}")
      {freq, freq_map} -> second_occurance(string, freq, freq_map)
      true -> IO.puts("No duplicate frequency found!")
    end
  end
end

One.read_input("lib/input.txt")
