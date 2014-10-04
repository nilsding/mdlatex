require "rspec"
require "redcarpet"
require File.expand_path "../render_latex.rb", File.dirname(__FILE__)

module Helpers
  def render_markdown(md)
    # we actually have to create a new renderer each time, or else redcarpet
    # fails after about four tests.
    # see also https://github.com/vmg/redcarpet/issues/318
    renderer = Redcarpet::Markdown.new(LaTeXRenderer, fenced_code_blocks: true,
                                       footnotes: true)
    renderer.render md
  end
end

RSpec.configure do |c|
  c.include Helpers
end