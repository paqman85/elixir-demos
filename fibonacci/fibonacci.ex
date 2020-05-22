defmodule Fibonacci do
    # start seqence
    # create next number
    # add new number to sequence
    # load next number
    # input how far to go
    # run until you get to number - return number

    def start() do
        how_far = IO.gets("How far do you want to go? -- must be higher then 4\n") |> String.trim |> String.to_integer

        if how_far >= 4 do
            fibseq = [0, 1, 1, 2]
            Enum.each(1..how_far, fn x -> x = get_next_number(fibseq) end) 
        else
            start()
        end
    end
    

    def get_next_number(fibseq) do
        last_two = Enum.take(fibseq, -2)
        IO.inspect(last_two, charlists: :as_lists)
        [ x | tail] = last_two
        y = List.last(fibseq)
        IO.puts(Integer.to_string(x))
        IO.puts(Integer.to_string(y))
        new_num = [calculate_last_two(x,y)]
        IO.puts("#{new_num}\n")

        new_fib_seq = fibseq ++ new_num
        IO.inspect(new_fib_seq, charlists: :as_lists)
    end

    def calculate_last_two(x, y) do
        new_num = x + y
    end
end