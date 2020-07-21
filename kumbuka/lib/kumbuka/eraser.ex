defmodule Kumbuka.Eraser do
  defstruct [:text, :steps]

  def new(text, no_of_steps) do
    __struct__(text: text, steps: build_steps(text, no_of_steps))
    |> eraser
  end

  def eraser(%__MODULE__{text: text, steps: [head | tail]} = passage) do
    # IO.inspect(passage)

    if Enum.count(passage.steps) > 1 do
      %__MODULE__{text: delete_chars(text, head), steps: tail}
      |> IO.inspect()
      |> eraser()
    else
      %__MODULE__{text: delete_chars(text, head), steps: tail}
    end
  end

  defp delete_chars(text, steps) do
    text
    |> String.graphemes()
    # |> IO.inspect()
    |> Enum.with_index(1)
    # |> IO.inspect()
    |> Enum.map(fn tuple -> replace(tuple, steps) end)
    # |> IO.inspect()
    |> Enum.join()
  end

  defp replace({char, index}, indexes) do
    # ? if step in steps
    if index in indexes do
      "_"
    else
      char
    end
  end

  defp build_steps(text, no_of_steps) do
    size = String.length(text)

    1..size
    |> Enum.shuffle()
    |> Enum.chunk_every(step_size(no_of_steps, size))
  end

  defp step_size(no_of_steps, size) do
    size
    |> Kernel./(no_of_steps)
    |> ceil
  end
end
