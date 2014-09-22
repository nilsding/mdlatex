#!/usr/bin/env ruby
#
# Usage: ruby mdlatex.rb markdownfile.md > output.latex
require "redcarpet"
require File.expand_path "./render_latex", File.dirname(__FILE__)

# a list of all Markdown extensions is available at
# https://github.com/vmg/redcarpet#and-its-like-really-simple-to-use
markdown = Redcarpet::Markdown.new(LaTeXRenderer, fenced_code_blocks: true)

content = ""

File.open(ARGV[0], 'r') do |f|
  content = f.read
end

puts markdown.render content

# kate: indent-width 2
