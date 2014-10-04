# mdlatex

[![build status](http://ci.rrerr.net/projects/1/status.png?ref=master)](http://ci.rrerr.net/projects/1?ref=master)

mdlatex is a simple Markdown to LaTeX conversion tool.  It works by providing
a new renderer class for [redcarpet](https://github.com/vmg/redcarpet).

## Features

* Write all your things in Markdown and convert them to LaTeX with ease!
* It's written in Ruby!
* Code syntax highlighting using minted and Pygments
* Won't eat your grandma!

## Installation

Install the dependencies:

* Ruby 1.9.3+
* A LaTeX distribution (with XeTeX included)
* minted (LaTeX package/style for syntax highlighting source code)
* Pygments (the syntax highlighter minted uses)
* redcarpet (you can do that by running either `bundle install` or
`gem install redcarpet`)

## Usage

1. Write your document in Markdown format
2. Run `ruby mdlatex.rb document.md > document.latex`
3. Include the converted file in your LaTeX document like this:

``` latex
\input{document.latex}
```

4. Compile to PDF using `xelatex -shell-escape real_document.latex`

An example document with output is in the `examples` directory.

There might be some unexpected behaviour (or even bugs!) in either the
Markdown parser or the converter, so you definitely should check the output of
the converter and probably edit it, too.
