# COM2043 Mini Language Compiler (MPL)

Course project for COM2043 Programming Language Concepts (Ankara University).

This repository contains a mini programming language named MPL (My Programming Language), implemented with Lex/Flex and Yacc/Bison in C. The project focuses on understanding tokenization, grammar-driven parsing, syntax errors, and how language design rules are formed.

## Course Context

- Course: COM2043 - Programming Language Concepts
- Institution: Ankara University
- Academic level: 2nd year, 1st semester

## Project Goal

The goal of this project is to practice compiler front-end fundamentals by designing a small language and validating its syntax using lexical and grammar analysis.

## Language Overview (MPL)

MPL uses custom keywords and symbols for declarations, expressions, conditions, and block statements.

### Core Keywords

- `GO` / `STOP`: program boundaries
- `NUM`, `DECIMAL`, `CHAR`: variable declarations
- `IF`, `ELSE`: conditional statements
- `LOOP`: loop-like control structure
- `SHOW`: display statement

### Operators and Symbols

- Assignment and punctuation: `=`, `;`
- Arithmetic: `+`, `-`, `*`, `/`
- Comparison: `==`, `!=`, `>`, `<`
- Logical operators: `#` (OR), `$` (AND)
- Parentheses: `(`, `)`
- Block delimiters: `>>`, `<<`

### Grammar Scope

The parser validates:

- variable declarations and assignments
- arithmetic expressions with precedence
- nested conditional blocks
- loop-style control blocks
- logical/comparison expressions

## Repository Contents

- `mpl.l`: lexical rules
- `mpl.y`: grammar rules
- `myprog.mpl`: sample MPL program
- `lex.yy.c`, `y.tab.c`, `y.tab.h`: generated lexer/parser files (kept intentionally)
- `Project Documents.pdf`: full project assignment/report document

## Project Document

Detailed project document (assignment/report):

- [Project Documents.pdf](Project%20Documents.pdf)

If GitHub does not preview the PDF in-browser, use the download button on the same page.

## Build and Run

There are two common ways to use this repository.

### Option 1: Build from generated sources (always works without data/)

This option does not regenerate files and is the most reliable way to run the project quickly.

Windows (PowerShell):

```powershell
gcc lex.yy.c y.tab.c -o mpl_parser.exe
Get-Content myprog.mpl | .\mpl_parser.exe
```

Linux/macOS:

```bash
gcc lex.yy.c y.tab.c -o mpl_parser
./mpl_parser < myprog.mpl
```

Expected successful parse output includes:

```text
OK
```

### Option 2: Regenerate lexer/parser, then build

Use this option when you edit `mpl.l` or `mpl.y`.

Windows (recommended with Win flex-bison installed globally):

```powershell
win_flex mpl.l
win_bison -d mpl.y
gcc lex.yy.c y.tab.c -o mpl_parser.exe
Get-Content myprog.mpl | .\mpl_parser.exe
```

Linux/macOS:

```bash
flex mpl.l
bison -d mpl.y
gcc lex.yy.c y.tab.c -o mpl_parser
./mpl_parser < myprog.mpl
```

If `win_flex` and `win_bison` are not available on Windows, install Win flex-bison first.

## Third-Party Tooling Note

This project may be used with Win flex-bison on Windows:

- SourceForge page: https://sourceforge.net/projects/winflexbison/

Important: some old portable packages include a local `yacc.exe` that expects a sibling `data/` directory. If you run that local executable after removing `data/`, regeneration can fail. This does not affect Option 1 above because generated source files are already included in the repository.

For clean and portable setup, prefer installed `win_bison`/`win_flex` (Windows) or `bison`/`flex` (Linux/macOS).

## License

This repository is licensed under the MIT License. See `LICENSE`.

Note: External tools (such as Win flex-bison and GNU Bison components) have their own licenses.

## Academic Use Notice

This is an educational course project. You may study and reference it, but do not submit this work as your own in academic settings.

## Author

- Ahmet Akpinar
- GitHub: https://github.com/one_byte_man
