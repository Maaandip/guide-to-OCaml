# guide-to-OCaml

I'm a CSE student , learning OCaml for quant finance and systems programming. 
This repo is my notes, examples and projects as I go deeper into the language.

Adding 2-3 examples daily — from hello world to async systems.

## why OCaml?

Honestly I started because Jane Street uses it heavily in trading systems. 
Turns out it's genuinely great — fast, safe, and the type system catches 
bugs before runtime. Worth learning if you're into finance or systems.

## what's here

| folder | what's inside |
|--------|--------------|
| 01_basics | variables, functions, recursion |
| 02_data_types | lists, tuples, records, variants |
| 03_functional | map, filter, fold, closures |
| 04_advanced | modules, functors, async |
| 05_projects | real projects |

## setup

```bash
brew install opam
opam init
opam install ocaml-lsp-server
```

run any file:
```bash
ocaml filename.ml
```

## projects built so far

- [async market data fan-out multiplexer](https://github.com/Maaandip/market-data-fanout-ocaml)

## useful links

- [Real World OCaml](https://dev.realworldocaml.org) — best free book
- [OCaml docs](https://ocaml.org)
- [Jane Street blog](https://blog.janestreet.com)
