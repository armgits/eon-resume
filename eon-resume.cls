% Eon Resume by Abhishekh Reddy (helloarm@pm.me)
% 
% A modern-looking tech resume
% HUGE Inspiration from: Dheera Venkatraman's resume https://dheera.net/about and Microsoft's Metro UI
% 
% Repository: https://github.com/armgits/eon-resume
% License and terms of use: TBD

% ------------------------------------------------------------------------------
% Class Identification
% ------------------------------------------------------------------------------
% !TeX program = xelatex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eon-resume}[2023/09/06 v0.7.0 A modern-looking tech resume]

% ------------------------------------------------------------------------------
% Base Class + Packages
% ------------------------------------------------------------------------------
\LoadClass {article}

\RequirePackage{etoolbox}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage[parfill]{parskip}
% \RequirePackage{fontspec}

% ------------------------------------------------------------------------------
% Design Rules and Document Style
% ------------------------------------------------------------------------------
\geometry
{
  a4paper,
  left = 0.1cm,
  right = 0.1cm,
  top = 0.1cm,
  bottom = 0.1cm
}

% \setmainfont{Brygada1918}[
%   Path=./BrygadaFontFiles/,
%   Extension = .ttf,
%   UprightFont=*-Regular,
%   BoldFont=*-Bold,
%   ItalicFont=*-Italic,
%   BoldItalicFont=*-BoldItalic
%   ]

% ------------------------------------------------------------------------------
% Resume Header
% ------------------------------------------------------------------------------
\let \personname \relax
\let \academiclevel \relax
\let \emailaddress \relax
\let \websiteurl \relax

\newcommand{\name}[2]
{
  \def \personname{\lowercase{{\bf#1} #2}}
}

\newcommand{\academiclvl}[2]
{
  \def \academiclevel{\lowercase{#1 in {\bf#2}}}
}

\newcommand{\email}[1]
{
  \def \emailaddress{#1}
}

\newcommand{\website}[1]
{
  \def \websiteurl{#1}
}

\newcommand{\printheader}
{
  \begin{center}
  \begin{tabularx}{\hsize}
  % layout (auto column-width)  [1]
  {
    @{}>{\raggedright\arraybackslash}X  % column 1
    >{\raggedleft\arraybackslash}X@{} % column 2
  }
  % table content
  \huge\personname & \Large\emailaddress \\
  \Large\academiclevel & \Large\websiteurl
  \end{tabularx}
  \end{center}
}

%  Prints the header [3]
\let \ori@document = \document % Store the original \document command
\renewcommand{\document}
{
	\ori@document  % Output the original \document command but add to it below
	\printheader % Output the header
}

% ------------------------------------------------------------------------------
% Helper Functions
% ------------------------------------------------------------------------------
\newcommand{\contenttable}[2]
{
  \begin{center}
  \begin{tabularx}{\hsize}
  % layout (75-25 column width distribution)  [1][2]
  {
    @{}>{\raggedright\arraybackslash\hsize=1.5\hsize\linewidth=\hsize}X  % column 1
    >{\raggedleft\arraybackslash\hsize=.5\hsize\linewidth=\hsize}X@{} % column 2
  }
  % table content
  \normalsize{#1} & \normalsize{#2}
  \end{tabularx}
  \end{center}
}

% ------------------------------------------------------------------------------
% Section Definition
% ------------------------------------------------------------------------------
\renewenvironment{section} [1]
{
  \lowercase{\Large{\bf{#1}}}
}{}

% ------------------------------------------------------------------------------
% Sub-Section Definitions
% ------------------------------------------------------------------------------
\newenvironment{school} [3]
{
  \contenttable {#1 at #2}{#3}
  \begin{list}{}{\setlength{\leftmargin}{0pt}\normalsize}
}
{
  \end{list}
}

\newcommand{\skills}[2]
{
  \begin{tabularx}{0.75\hsize}  %[1][2]
    % layout (25-75 column width distribution)
    {
      @{}>{\hsize=.5\hsize\linewidth=\hsize}X  % column 1
      >{\hsize=1.5\hsize\linewidth=\hsize}X % column 2
    }
    % table content
    \normalsize{#1} & \normalsize{#2}
  \end{tabularx}
}

\newenvironment{work}[4]
{
  \contenttable{\ifblank{#3}{#1 at #2}{#1 at #2, #3}}{#4}   %[4]
  \begin{list}{$\cdot$}{\setlength{\leftmargin}{8pt}\normalsize}
}
{
  \end{list}
}

\newenvironment{project}[3]
{
  \contenttable{\ifblank{#2}{#1}{#1 as #2}}{#3}   %[4]
  \begin{list}{$\cdot$}{\setlength{\leftmargin}{8pt}\normalsize}
}
{
  \end{list}
}

% ------------------------------------------------------------------------------
% Code References
% ------------------------------------------------------------------------------
% 1. Section "Tables with a fixed width" from https://www.overleaf.com/learn/latex/Tables
% 2. Section 4.3 from https://texdoc.org/serve/tabularx.pdf/0
% 3. Code from this template http://www.latextemplates.com/template/medium-length-professional-cv
% 4. Section 3.6.3 from http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/etoolbox/etoolbox.pdf