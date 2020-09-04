defmodule Joviscript.Dfa do
  defstruct [
    states: MapSet.new(['Q0', 'Q1']),
    alphabet: MapSet.new(['1', '0']),
    transitions: %{
      Q0: [{'1', 'Q0'}, {'0', 'Q1'}],
      Q1: [{'1', 'Q1'}, {'0', 'Q0'}]
    },
    initial_state: 'Q0',
    final_states: MapSet.new(['Q0'])
  ]

  def create(states, alphabet, transitions, initial_state, final_states) do
    cond do
      !Enum.any?(states, fn state -> state == initial_state end) -> {:error, :invalid_initial_state}
      !Enum.all?(final_states, fn final_state -> 
        Enum.any?(states, fn state -> state == final_state end) 
      end) -> {:error, :some_final_state_is_not_in_states}
      true -> %Joviscript.Dfa{
          states: states, 
          alphabet: alphabet, 
          transitions: transitions,
          initial_state: initial_state,
          final_states: final_states
        }
    end
  end
end
