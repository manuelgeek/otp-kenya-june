defmodule Hesabu.Boundary do
	alias Hesabu.Core

  def start(initial_count) do
    spawn(fn -> run(initial_count) end)
	end 
	
	def run(count) do
		count 
		 |> listen()		 		
		 |> run()		
	end

	def listen(count) do
		receive do
			:inc -> 
				Core.inc(count)
			:dec ->
				Core.dec(count)
			{:count, from} -> 
				send from, count
				count				
		end		
	end 
end