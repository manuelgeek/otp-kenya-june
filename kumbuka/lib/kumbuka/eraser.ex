defmodule Kumbuka.Eraser do
  defstruct [:text, :steps]

  def new(text, no_of_steps) do
    __struct__(text: text, steps: build_steps(text, no_of_steps))
  end

  def new_text(%{text: text, steps: steps}) do
    no_of_steps = Enum.random(steps)

    Enum.reduce(no_of_steps, %{text: text}, fn step, acc ->
      pattern = String.at(text, step - 1)

      new_text = String.replace(text, pattern, "_")

      %{acc | text: new_text}
    end)
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
