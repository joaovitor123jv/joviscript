defmodule Joviscript.LexicalAnalyzer.Dfa do
  def create() do
    %Joviscript.Dfa{
      states: MapSet.new([
        :start, 
        :number, 
        :error, 
        :subtraction, 
        :token, 
        :scope_opening,
        :scope_ending,
        :sum]),
      alphabet: MapSet.new([
        :'0', :'1', :'2', :'3', :'4', :'5', :'6', :'7', :'8', :'9',

        :a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r,
        :s, :t, :u, :v, :w, :x, :y, :z,

        :A, :B, :C, :D, :E, :F, :G, :H, :I, :J, :K, :L, :M, :N, :O, :P, :Q, :R,
        :S, :T, :U, :V, :W, :X, :Y, :Z,

        :+, :-, :'(', :')'
          ]),
      transitions: %{
        start: %{
          '0': :number, '1': :number, '2': :number, '3': :number, '4': :number, 
          '5': :number, '6': :number, '7': :number, '8': :number, '9': :number, 

          -: :subtraction, +: :sum, '(': :scope_opening, ')': :scope_ending,

          A: :token, B: :token, C: :token, D: :token,
          E: :token, F: :token, G: :token, H: :token,
          I: :token, J: :token, K: :token, L: :token,
          M: :token, N: :token, O: :token, P: :token,
          Q: :token, R: :token, S: :token, T: :token,
          U: :token, V: :token, W: :token, X: :token,
          Y: :token, Z: :token, 

          a: :token, b: :token, c: :token, d: :token, 
          e: :token, f: :token, g: :token, h: :token, 
          i: :token, j: :token, k: :token, l: :token,
          m: :token, n: :token, o: :token, p: :token,
          q: :token, r: :token, s: :token, t: :token,
          u: :token, v: :token, w: :token, x: :token,
          y: :token, z: :token
        },

        sum: %{
          '0': :error, '1': :error, '2': :error,
          '3': :error, '4': :error, '5': :error,
          '6': :error, '7': :error, '8': :error,
          '9': :error,

          '(': :error, ')': :error,

          -: :token, +: :token,

          A: :token, B: :token, C: :token, D: :token,
          E: :token, F: :token, G: :token, H: :token,
          I: :token, J: :token, K: :token, L: :token,
          M: :token, N: :token, O: :token, P: :token,
          Q: :token, R: :token, S: :token, T: :token,
          U: :token, V: :token, W: :token, X: :token,
          Y: :token, Z: :token, 

          a: :token, b: :token, c: :token, d: :token, 
          e: :token, f: :token, g: :token, h: :token, 
          i: :token, j: :token, k: :token, l: :token,
          m: :token, n: :token, o: :token, p: :token,
          q: :token, r: :token, s: :token, t: :token,
          u: :token, v: :token, w: :token, x: :token,
          y: :token, z: :token
        },

        subtraction: %{
          '0': :number, '1': :number, '2': :number,
          '3': :number, '4': :number, '5': :number,
          '6': :number, '7': :number, '8': :number,
          '9': :number,

          '(': :error, ')': :error,

          -: :token, +: :token,

          A: :token, B: :token, C: :token, D: :token,
          E: :token, F: :token, G: :token, H: :token,
          I: :token, J: :token, K: :token, L: :token,
          M: :token, N: :token, O: :token, P: :token,
          Q: :token, R: :token, S: :token, T: :token,
          U: :token, V: :token, W: :token, X: :token,
          Y: :token, Z: :token, 

          a: :token, b: :token, c: :token, d: :token, 
          e: :token, f: :token, g: :token, h: :token, 
          i: :token, j: :token, k: :token, l: :token,
          m: :token, n: :token, o: :token, p: :token,
          q: :token, r: :token, s: :token, t: :token,
          u: :token, v: :token, w: :token, x: :token,
          y: :token, z: :token
        },

        token: %{
          '0': :token, '1': :token, '2': :token,
          '3': :token, '4': :token, '5': :token,
          '6': :token, '7': :token, '8': :token,
          '9': :token,

          '(': :error, ')': :error,

          -: :token, +: :token,

          A: :token, B: :token, C: :token, D: :token,
          E: :token, F: :token, G: :token, H: :token,
          I: :token, J: :token, K: :token, L: :token,
          M: :token, N: :token, O: :token, P: :token,
          Q: :token, R: :token, S: :token, T: :token,
          U: :token, V: :token, W: :token, X: :token,
          Y: :token, Z: :token, 

          a: :token, b: :token, c: :token, d: :token, 
          e: :token, f: :token, g: :token, h: :token, 
          i: :token, j: :token, k: :token, l: :token,
          m: :token, n: :token, o: :token, p: :token,
          q: :token, r: :token, s: :token, t: :token,
          u: :token, v: :token, w: :token, x: :token,
          y: :token, z: :token
        },

        number: %{
          '0': :number, '1': :number, '2': :number,
          '3': :number, '4': :number, '5': :number,
          '6': :number, '7': :number, '8': :number,
          '9': :number,

          '(': :error, ')': :error,

          -: :error, +: :error,

          A: :error, B: :error, C: :error, D: :error,
          E: :error, F: :error, G: :error, H: :error,
          I: :error, J: :error, K: :error, L: :error,
          M: :error, N: :error, O: :error, P: :error,
          Q: :error, R: :error, S: :error, T: :error,
          U: :error, V: :error, W: :error, X: :error,
          Y: :error, Z: :error, 

          a: :error, b: :error, c: :error, d: :error, 
          e: :error, f: :error, g: :error, h: :error, 
          i: :error, j: :error, k: :error, l: :error,
          m: :error, n: :error, o: :error, p: :error,
          q: :error, r: :error, s: :error, t: :error,
          u: :error, v: :error, w: :error, x: :error,
          y: :error, z: :error
        },

        error: %{
          '0': :error, '1': :error, '2': :error,
          '3': :error, '4': :error, '5': :error,
          '6': :error, '7': :error, '8': :error,
          '9': :error,

          '(': :error, ')': :error,

          -: :error, +: :error,

          A: :error, B: :error, C: :error, D: :error,
          E: :error, F: :error, G: :error, H: :error,
          I: :error, J: :error, K: :error, L: :error,
          M: :error, N: :error, O: :error, P: :error,
          Q: :error, R: :error, S: :error, T: :error,
          U: :error, V: :error, W: :error, X: :error,
          Y: :error, Z: :error, 

          a: :error, b: :error, c: :error, d: :error, 
          e: :error, f: :error, g: :error, h: :error, 
          i: :error, j: :error, k: :error, l: :error,
          m: :error, n: :error, o: :error, p: :error,
          q: :error, r: :error, s: :error, t: :error,
          u: :error, v: :error, w: :error, x: :error,
          y: :error, z: :error
        },
        scope_opening: %{
          '0': :error, '1': :error, '2': :error,
          '3': :error, '4': :error, '5': :error,
          '6': :error, '7': :error, '8': :error,
          '9': :error,

          '(': :error, ')': :error,

          -: :error, +: :error,

          A: :error, B: :error, C: :error, D: :error,
          E: :error, F: :error, G: :error, H: :error,
          I: :error, J: :error, K: :error, L: :error,
          M: :error, N: :error, O: :error, P: :error,
          Q: :error, R: :error, S: :error, T: :error,
          U: :error, V: :error, W: :error, X: :error,
          Y: :error, Z: :error, 

          a: :error, b: :error, c: :error, d: :error, 
          e: :error, f: :error, g: :error, h: :error, 
          i: :error, j: :error, k: :error, l: :error,
          m: :error, n: :error, o: :error, p: :error,
          q: :error, r: :error, s: :error, t: :error,
          u: :error, v: :error, w: :error, x: :error,
          y: :error, z: :error
        },
        scope_ending: %{
          '0': :error, '1': :error, '2': :error,
          '3': :error, '4': :error, '5': :error,
          '6': :error, '7': :error, '8': :error,
          '9': :error,

          '(': :error, ')': :error,

          -: :error, +: :error,

          A: :error, B: :error, C: :error, D: :error,
          E: :error, F: :error, G: :error, H: :error,
          I: :error, J: :error, K: :error, L: :error,
          M: :error, N: :error, O: :error, P: :error,
          Q: :error, R: :error, S: :error, T: :error,
          U: :error, V: :error, W: :error, X: :error,
          Y: :error, Z: :error, 

          a: :error, b: :error, c: :error, d: :error, 
          e: :error, f: :error, g: :error, h: :error, 
          i: :error, j: :error, k: :error, l: :error,
          m: :error, n: :error, o: :error, p: :error,
          q: :error, r: :error, s: :error, t: :error,
          u: :error, v: :error, w: :error, x: :error,
          y: :error, z: :error
        }
        },
        initial_state: :start,
        final_states: MapSet.new([
          :number, 
          :token, 
          :sum, 
          :subtraction,
          :scope_opening,
          :scope_ending
        ])
        }
  end
end
