require File.expand_path "../spec_helper.rb", __FILE__

describe LaTeXRenderer do
  it "should render nested lists" do
    rendered = render_markdown <<-MD
* This is a list item.
* This is another list item.
  * Another one, this time it's nested!
  * Even more nested items.
* No more nested things.
MD
    expect(rendered.scan(/(\\begin\{itemize\})/).length).to be(2)
  end
  
  it "should render code blocks with a language" do
    rendered = render_markdown <<-MD
``` ruby
IS_CONSTANT = true

class Hello
  def self.greet(name)
    "Hello there, #\{name}!"
  end
end

Hello.greet "world"
```
MD
    expect(rendered).to include "\\begin{minted}{ruby}"
  end
  
  it "should render code blocks without a specified language as text" do
    rendered = render_markdown <<-MD
```
This should be rendered as text.  Hello there!
```
MD
    expect(rendered).to include "\\begin{minted}{text}"
  end
  
  it "should render hyperlinks" do
    url = "http://git.rrerr.net/nilsding/mdlatex"
    content = "mdlatex"
    rendered = render_markdown <<-MD
Normal links: [#{content}](#{url}) is great!

Referenced links: [#{content}][ref1] makes my dog happy

[ref1]: #{url}
MD
    expect(rendered.scan(/(\\href\{#{url}\}\{#{content}\})/).length).to be(2)
  end
  
  it "should render inline code" do
    rendered = render_markdown <<-MD
This is a text, containing `evil backticks`, which gets rendered as inline code
span.
MD
    expect(rendered).to include "\\texttt{"
  end
  
  it "should render headers as new sections" do
    rendered = render_markdown <<-MD
# Now this is almost a real document!

It even features several subsections.

## A subsection.

In \\LaTeX, you can use `\\textbackslash{}texttt\\{text\\}` to make it look like
it was written with a typewriter.

## Lorem ipsum

dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. 

### Nobody knows the trouble I've seen

Not even Jesus.

#### However, a subsubsubsection does not exist.

Another section.
================

This time with a different header style.

Subsection number 666
---------------------

That's all, folks!
MD
    expect(rendered.scan(/(\\(sub){0,2}?section\{(.*)})/).length).to be(6)
  end
end

# kate: indent-width 2