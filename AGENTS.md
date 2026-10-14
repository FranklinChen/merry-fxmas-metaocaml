# AGENTS.md

Instructions for anyone, human or coding agent, changing this repository. Read [README.md](README.md) for what the project teaches and [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) for how the build is wired; this file is the short list of rules and the checks to run.

## What this is

A teaching example of multi-stage programming with BER MetaOCaml: a generator (`src/merry_fxmas.ml`) builds code that prints a 25-line countdown, and `bin/main.ml` compiles and runs it. The README is a tutorial, so its correctness and clarity matter as much as the code's.

## Environment

The compiler is BER MetaOCaml, opam package `ocaml-variants.5.3.0+BER`, in a switch local to the checkout (`_opam/`, git-ignored):

```console
$ opam switch create . ocaml-variants.5.3.0+BER --deps-only --with-test
$ eval $(opam env)
```

Run every command below inside that switch. A stock OCaml compiler cannot parse `.< >.` or `.~`.

## Commands

| Task | Command |
| --- | --- |
| Build | `dune build` |
| Test (output and generated code) | `dune test` |
| Run | `dune exec merry-fxmas` |
| Interactive MetaOCaml toplevel | `metaocaml` |
| Regenerate the opam file after editing `dune-project` | `dune build @opam && dune promote` |
| Lint the opam file | `opam lint merry-fxmas.opam` |
| Lint the CI workflow | `actionlint && zizmor --offline .github/workflows/CI.yml` |

## Rules

1. **`merry-fxmas.opam` is generated.** Change package metadata and dependencies only in `dune-project`, then regenerate. CI fails on a stale opam file.
2. **Depend on `metaocaml_byte`, never on `metaocaml` directly.** `src/metaocaml_byte/dune` supplies the link dependencies and order that dune cannot read from MetaOCaml's `META`. An executable that depends on `metaocaml` without `metaocaml_byte` fails to link (`No implementation provided for ... Toploop`).
3. **Everything that runs generated code is bytecode.** Keep `(modes byte)` on libraries, executables and tests; `Runcode.run` needs the in-process toplevel, which exists only in bytecode.
4. **Review an expected-file diff before promoting it.** `test/print_code.expected` is the generated code, the thing this project exists to show. A diff there means the staging changed. Run `dune promote` only after reading the diff and confirming the change is intended, and say why in the commit message.
5. **Types used inside brackets come from separately compiled modules.** A constructor or record label declared in the same file cannot appear inside `.< >.`; put such types in their own module.
6. **The README's toplevel transcripts are real output.** After changing the generator, the compiler version or any example, rerun each example in `metaocaml` (from the project root, using `metaocaml -noinit` to avoid a personal `~/.ocamlinit`) and paste what it prints, rather than what it should print.
7. **Keep the docs in step with the code in the same change.** Explanations of build wiring live once, in `docs/ARCHITECTURE.md`; comments in `dune` files and the workflow point to its sections by title, so renaming a section means updating those pointers.
8. **CI uses the latest releases.** Before editing `.github/workflows/CI.yml`, look up each action's latest release (`gh api repos/<owner>/<action>/releases/latest --jq .tag_name`), pin the floating major tag if one exists (verify with `gh api repos/<owner>/<action>/git/ref/tags/<tag>`), and fix any deprecation warning a run reports in the same change.
9. **Upgrading BER MetaOCaml** means changing the compiler version in `dune-project`, the README, this file, `docs/ARCHITECTURE.md` and `.github/workflows/CI.yml`. Find the newest published version with `opam show ocaml-variants --field=all-versions`; the BER versions end in `+BER`. Then rebuild the switch, rerun the README transcripts and review the `print_code.expected` diff, which may change with the pretty-printer.
10. **Prose style:** no em-dashes or en-dashes anywhere, including comments and commit messages. Use commas, parentheses, colons, semicolons or separate sentences; use a plain hyphen for ranges.

## Before calling a change done

```console
$ dune build @opam && dune build && dune test && dune exec merry-fxmas
$ opam lint merry-fxmas.opam
$ actionlint
$ git diff --check
```

All must succeed, and CI must be green on both Linux and macOS.
