\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eon-resume}[2023/08/29 v0.1.0 Minimal, futuristic, text-based resume.]

\LoadClass{article}

% \RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage[parfill]{parskip}

\geometry
{
  a4paper,
  left=0.1cm,
  right=0.1cm,
  top=0.1cm,
  bottom=0.1cm
}

\let \personname \relax
\let \academiclevel \relax
\let \emailaddress \relax
\let \websiteurl \relax

\newcommand{\name}[2]
{
  \def \personname {\lowercase{{\bf#1} #2}}
}

\newcommand{\academiclvl}[2]
{
  \def \academiclevel {\lowercase{#1 in {\bf#2}}}
}

\newcommand{\email}[1]
{
  \def \emailaddress {#1}
}

\newcommand{\website}[1]
{
  \def \websiteurl {#1}
}

\newcommand{\printheader}
{
  \begin{center}
  \begin{tabularx}{\hsize}  %[1]
  % layout formatting
  {
    @{}>{\raggedright\arraybackslash}X  % column 1 format
    >{\raggedleft\arraybackslash}X@{} % column 2 format
  }
  % table content
  \huge\personname & \Large\emailaddress \\
  \Large\academiclevel & \Large\websiteurl
  \end{tabularx}
  \end{center}
}

%  Prints the header [3]
\let\ori@document=\document % Store the original \document command
\renewcommand{\document}
{
	\ori@document  % Output the original \document command but add to it below
	\printheader % Output the header
}

% Helper function to create title/school and year in two tabular columns
\newcommand{\contenttable}[2]
{
  \begin{center}
  \begin{tabularx}{\hsize}  %[1][2]
  % layout formatting
  {
    @{}>{\raggedright\arraybackslash\hsize=1.5\hsize\linewidth=\hsize}X  % column 1 format
    >{\raggedleft\arraybackslash\hsize=.5\hsize\linewidth=\hsize}X@{} % column 2 format
  }
  % table content
  \normalsize{#1} & \normalsize{#2}
  \end{tabularx}
  \end{center}
}

\newcommand{\skills}[2]
{
  \begin{tabularx}{0.75\hsize}  %[1][2]
  % layout formatting
  {
    @{}>{\hsize=.5\hsize\linewidth=\hsize}X  % column 1 format
    >{\hsize=1.5\hsize\linewidth=\hsize}X % column 2 format
  }
    \normalsize{#1} & \normalsize{#2}
  \end{tabularx}
}

\renewenvironment{section}[1]
{
  \lowercase{\Large{\bf{#1}}}
}{}

\newenvironment{school}[3]
{
  \contenttable{#1 at #2}{#3}
  \begin{list}{}{\setlength{\leftmargin}{0pt}\normalsize}
}
{
  \end{list}
}

\newenvironment{work}[3]
{
  \contenttable{#1 at #2}{#3}
  \begin{list}{$\cdot$}{\setlength{\leftmargin}{8pt}\normalsize}
}
{
  \end{list}
}

% References
% 1. Section "Tables with a fixed width" from https://www.overleaf.com/learn/latex/Tables
% 2. Section 4.3 from https://texdoc.org/serve/tabularx.pdf/0
% 3. Code from this template http://www.latextemplates.com/template/medium-length-professional-cv

