defmodule Kumbuka.Eraser do
  defstruct [:text, :steps]

  def new(text, no_of_steps) do
    __struct__(text: text, steps: build_steps(text, no_of_steps))
  end

  def erase(%__MODULE__{steps: []} = passage) do
    passage
  end

  def erase(%__MODULE__{text: text, steps: [step | steps]} = passage) do
    %{passage | steps: steps, text: delete_chars(text, step)}
    |> erase()
  end

  def delete_chars(text, step) do
    text
    |> String.graphemes()
    |> Enum.with_index(1)
    |> Enum.map(fn tuple -> replace(tuple, step) end)
    |> Enum.join()
  end

  defp replace({char, index}, indices) do
    if index in indices do
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
