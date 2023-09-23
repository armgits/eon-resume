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
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eon-resume}[2023/09/07 v0.8.0 A modern-looking tech resume]

% ------------------------------------------------------------------------------
% Base Class + Packages
% ------------------------------------------------------------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{etoolbox}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage[parfill]{parskip}
\RequirePackage{fontspec}
\RequirePackage{xcolor}

% ------------------------------------------------------------------------------
% Design Rules and Document Style
% ------------------------------------------------------------------------------
\geometry
{
  a4paper,
  left = 1.27cm,
  right = 1.27cm,
  top = 1.27cm,
  bottom = 1.27cm
}

\setmainfont{D-DIN}
[
  Path = ./font/d-din/,
  Extension = .otf,
  UprightFont = D-DIN,
  BoldFont = D-DIN-Bold,
  ItalicFont = D-DIN-Italic
]

\definecolor{content-black}{HTML}{000000}
\definecolor{gray-3}{HTML}{414042}
\definecolor{gray-1}{HTML}{6D6E71}
\definecolor{gray-2}{HTML}{58595B}

\thispagestyle{empty}

% ------------------------------------------------------------------------------
% Resume Header
% ------------------------------------------------------------------------------
\let \personname \relax
\let \academiclevel \relax
\let \emailaddress \relax
\let \websiteurl \relax

\setlength{\parskip}{6pt}

\newcommand{\name}[2]
{
  \def \personname{\lowercase{{\bf#1} \textcolor{gray-1}{#2}}}
}

\newcommand{\academiclvl}[2]
{
  \def \academiclevel{\lowercase{\textcolor{gray-1}{#1 in} #2}}
}

\newcommand{\email}[2]
{
  \def \emailaddress{#1\textcolor{gray-1}{@#2}}
}

\newcommand{\website}[2]
{
  \def \websiteurl{\textcolor{gray-1}{#1/}#2}
}

\newcommand{\printheader}
{
  \begingroup
  \renewcommand{\arraystretch}{1.25}
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
  \endgroup
  \bigskip
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
  \normalsize{#1} & \small{\textcolor{gray-1}{#2}}
  \end{tabularx}
  \end{center}
}

\newcommand{\makegraylabel}[1]
{
  \textcolor{gray-1}{#1}
}

% ------------------------------------------------------------------------------
% Section Definition
% ------------------------------------------------------------------------------
\renewenvironment{section} [1]
{
  \lowercase{\Large{\bf{\textcolor{gray-2}{#1}}}}
}{}

% ------------------------------------------------------------------------------
% Sub-Section Definitions
% ------------------------------------------------------------------------------
\newenvironment{school} [3]
{
  \setlength{\parskip}{0pt}
  \contenttable{#1 \textcolor{gray-1}{at #2}}{#3}
  \begin{list}{}
  {
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{0pt}
    \normalsize
    \setlength{\topsep}{4pt}
    \setlength{\parsep}{2pt}
    \let\makelabel=\makegraylabel
  }
}
{
  \end{list}
}

\newenvironment{work}[4]
{
  \setlength{\parskip}{0pt}
  \contenttable{\ifblank{#3}{#1 at #2}{#1 at #2, #3}}{#4}   %[4]
  \begin{list}{$\cdot$}
  {
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{11pt}
    \normalsize
    \setlength{\topsep}{4pt}
    \setlength{\parsep}{2pt}
  }
}
{
  \end{list}
}

\newenvironment{project}[3]
{
  \setlength{\parskip}{0pt}
  \contenttable{\ifblank{#2}{#1}{#1 as #2}}{#3}   %[4]
  \begin{list}{$\cdot$}
  {
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{11pt}
    \normalsize
    \setlength{\topsep}{4pt}
    \setlength{\parsep}{2pt}
  }
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