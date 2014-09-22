class LaTeXRenderer < Redcarpet::Render::Base
  def doc_header()
    "% This file was converted from Markdown using Redcarpet #{Redcarpet::VERSION} and
% render_latex.rb, usually in combination with mdlatex.rb.
% 
% render_latex and mdlatex (c) 2014 nilsding\n\n"
  end
  
  def doc_footer()
    "\n% -=[ EOF ]=-\n\n"
  end
  
  def header(title, level)
    case level
    when 1
      "\\section{#{title}}\n"
    when 2
      "\\subsection{#{title}}\n"
    when 3
      "\\subsubsection{#{title}}\n"
    end
  end

  def linebreak()
    " \\\\\n"
  end

  def paragraph(text)
    "\n#{text}\n"
  end

  def list(content, list_type)
    case list_type
    when :ordered
      "\\begin{enumerate}\n#{content}\n\\end{enumerate}\n"
    when :unordered
      "\\begin{itemize}\n#{content}\n\\end{itemize}\n"
    end
  end

  def list_item(content, list_type)
    case list_type
    when :ordered, :unordered
      " \\item #{content.strip}\n"
    end
  end

  def block_code(code, language)
    language = "text" if language.strip.empty?
    "\\begin{minted}{#{language}}\n#{code.gsub("\\", "\\\\")}\\end{minted}\n"
  end

   def triple_emphasis(text)
     "\\textbf{\\emph{#{text}}}" # ???
   end

  def double_emphasis(text)
    "\\textbf{#{text}}"
  end

  def emphasis(text)
    "\\emph{#{text}}"
  end
  
  def underline(text)
    "\\underline{#{text}}"
  end
  
  def codespan(code)
    "\\texttt{#{code.gsub("_", "\\_")}}"
  end
  
  def hrule()
    "\n \\hrule \n"
  end
  
  def superscript(text)
    "$^{\\textrm{#{text}}}$"
  end
end

# kate: indent-width 2
