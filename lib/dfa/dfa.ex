defmodule Joviscript.Dfa do
  defstruct states: MapSet.new([:qa, :qb]),
            alphabet: MapSet.new([:a, :b]),
            transitions: %{
              q0: %{
                a: :qa,
                b: :qb
              },
              q1: %{
                a: :qb,
                b: :qa
              }
            },
            initial_state: :qa,
            final_states: MapSet.new([:qa])

  def create(states, alphabet, transitions, initial_state, final_states) do
    cond do
      !Enum.any?(states, fn state -> state == initial_state end) ->
        {:error, :invalid_initial_state}

      !Enum.all?(final_states, fn final_state ->
        Enum.any?(states, fn state -> state == final_state end)
      end) ->
        {:error, :some_final_state_is_not_in_states}

      true ->
        %Joviscript.Dfa{
          states: states,
          alphabet: alphabet,
          transitions: transitions,
          initial_state: initial_state,
          final_states: final_states
        }
    end
  end

  def advance_state(_dfa, [], current_state) do
    current_state
  end

  def advance_state(dfa, [current_symbol | tail], current_state) do
    # IO.puts "On State |#{current_state}|, received: |#{current_symbol}|"

    next_state = dfa.transitions[current_state][current_symbol]
    advance_state(dfa, tail, next_state)
  end

  def test(%Joviscript.Dfa{} = dfa, test_chain) do
    symbols_sequence = test_chain
                       |> String.graphemes()
                       |> Enum.map(fn character -> String.to_atom(character) end)

    final_state = advance_state(dfa, symbols_sequence, dfa.initial_state)

    IO.puts("Final state after test: #{final_state}")

    final_state
  end
end
