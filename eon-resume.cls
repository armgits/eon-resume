% Eon Resume by Abhishekh Reddy (helloarm@pm.me)
%
% A modern-looking tech resume
% HUGE Inspiration from: Dheera Venkatraman's resume https://dheera.net/about
% and Microsoft's Metro UI
%
% Repository: https://github.com/armgits/eon-resume
% License and terms of use: TBD

% ------------------------------------------------------------------------------
% Class Identification
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eon-resume}[2023/09/07 v0.9.0 A modern-looking tech resume]

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
\RequirePackage{hyperref}

% ------------------------------------------------------------------------------
% Design Rules and Document Style
% ------------------------------------------------------------------------------
% Paper and margin sizes
\geometry
{
  letterpaper,
  left = 1cm,
  right = 1cm,
  top = 1cm,
  bottom = 1cm
}

% Typeface
\setmainfont{D-DIN}
[
  Path = ./font/d-din/,
  Extension = .otf,
  UprightFont = D-DIN,
  BoldFont = D-DIN-Bold,
  ItalicFont = D-DIN-Italic
]

% Spacing between resume sections
\setlength{\parskip}{4pt}

% Font colors
\definecolor{gray-1}{HTML}{6D6E71}
\definecolor{gray-2}{HTML}{58595B}
\definecolor{gray-3}{HTML}{414042}

% Disables page numbers at the bottom
\thispagestyle{empty}

% Hyperlinks settings
\hypersetup
{
  colorlinks=true,
  linkcolor=gray-2,
  filecolor=magenta,
  urlcolor=gray-2,
  pdftitle={Abhishekh Reddy Munnangi},
  urlbordercolor=1 1 0
}

% ------------------------------------------------------------------------------
% Resume Header
% ------------------------------------------------------------------------------
\let \personname \relax
\let \academiclvl \relax
\let \cstmtagline \relax
\let \emailaddress \relax
\let \websiteurl \relax
\let \phonenumber \relax

% Parameter #1 - First name
% Parameter #2 - Last name
\newcommand{\name}[2]
{
  \def \personname {\lowercase{{\bf#1} \textcolor{gray-2}{#2}}}
}

% Parameter #1 - Year of study
% Parameter #2 - Major
\newcommand{\academiclevel}[2]
{
  \def \academiclvl {\lowercase{\textcolor{gray-2}{#1 in} #2}}
}

% Parameter #1 - First field
% Parameter #2 - Highlight
% Parameter #3 - Second field
\newcommand{\customtagline}[3]
{
  \def \cstmtagline {\lowercase{\textcolor{gray-2}{#1} #2 \textcolor{gray-2}{#3}}}
}

% Parameter #1 - Email/Directory ID
% Parameter #2 - Domain
\newcommand{\email}[2]
{
  \def \emailaddress {
    \href{mailto:#1@#2}{\textcolor{black}{#1}\textcolor{gray-2}{@#2}}
  }
}

% Parameter #1 - Domain
% Parameter #2 - Subdirectory and parameters
\newcommand{\website}[2]
{
  \def \websiteurl {
    \href{https://#1/#2}{\textcolor{gray-2}{#1/}\textcolor{black}{#2}}}
}

% Parameter #1 - Country Code
% Parameter #2 - Phone Number
\newcommand{\phone}[2]
{
  \def \phonenumber{\textcolor{gray-2}{#1} {#2}}
}

\newcommand{\printheader}
{
  \let \contactinfo \relax
  \ifundef{\phonenumber} {
    % true
    \def \contactinfo {\websiteurl}
  } {
    % false
    \def \contactinfo {\phonenumber}
  }

  \let \tagline \relax
  \ifundef{\cstmtagline} {
    % true
    \def \tagline {\academiclvl}
  } {
    % false
    \def \tagline {\cstmtagline}
  }

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
  \Large\tagline & \Large\contactinfo
  \end{tabularx}
  \end{center}
  \endgroup
  \medskip
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
% Parameter #1 - Title
% Parameter #2 - Dates
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
  \normalsize{#1} & \small{\textcolor{gray-2}{#2}}
  \end{tabularx}
  \end{center}
}

% Parameter #1 - Skill Category
% Parameter #2 - Particular Skills
\newcommand{\skill}[2]
{
  \setlength{\parskip}{0pt}
  \begin{center}
  \begin{tabularx}{\textwidth\normalsize}
  % table layout
  {
    @{}>{\raggedright\arraybackslash\hsize=.5\hsize\linewidth=\hsize}X
    >{\raggedright\arraybackslash\hsize=1.5\hsize\linewidth=\hsize}X
  }
    % table content
    #1 & \textcolor{gray-3}{#2}
  % \smallskip
  \end{tabularx}
  \end{center}
}

% ------------------------------------------------------------------------------
% Section Definition
% ------------------------------------------------------------------------------
% Parameter #1 - Section Title
\renewenvironment{section}[1]
{
  \lowercase{\Large{\bf{\textcolor{gray-2}{#1}}}}
}{}

% ------------------------------------------------------------------------------
% Sub-Section Definitions
% ------------------------------------------------------------------------------
% Parameter #1 - Degree and Major
% Parameter #2 - School/University
% Parameter #3 - Dates
\newenvironment{school} [3]
{
  \setlength{\parskip}{0pt}
  \contenttable{#1 \textcolor{gray-2}{at #2}}{#3}
  \begin{list}{}
  {
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{0pt}
    \setlength{\topsep}{2pt}
    \setlength{\parsep}{2pt}
    \normalsize
    \color{gray-3}
  }
}
{
  \end{list}
}

\newenvironment{skills}
{
  \setlength{\parskip}{0pt}
  \begin{list}{}
  {
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{0pt}
    \setlength{\topsep}{2pt}
    \setlength{\parsep}{-3pt}
    \setlength{\itemsep}{2pt}
    \normalsize
  }
}
{
  \end{list}
}

% Parameter #1 - Title
% Parameter #2 - Company/Organization
% Parameter #3 - Location
% Parameter #4 - Dates
\newenvironment{work}[4]
{
  \let \worktitle \relax
  \ifblank{#3} {
    % true
    \def \worktitle {#1 \textcolor{gray-2}{at #2}}
  } {
    % false
    \def \worktitle {#1 \textcolor{gray-2}{at #2, #3}}
  }

  \setlength{\parskip}{0pt}
  \contenttable{\worktitle}{#4}   %[4]
  \begin{list}{\char"2022}
  {
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{11pt}
    \setlength{\topsep}{4pt}
    \setlength{\parsep}{2pt}
    \normalsize
  }
}
{
  \end{list}
}

% Parameter #1 - Project Title
% Parameter #2 - Project Type
% Parameter #3 - Dates
% Parameter #4 - Project Link
\newenvironment{project}[4]
{
  \let \projectname \relax
  \let \projecttitle \relax

  \ifblank{#4} {
    % true
    \def \projectname { #1 }
  } {
    \def \projectname { \href{#4}{\textcolor{black}{#1}} }
  }

  \ifblank{#2} {
    % true
    \def \projecttitle {\projectname}
  } {
    % false
    \def \projecttitle {\projectname \textcolor{gray-2}{as #2}}
  }

  \setlength{\parskip}{0pt}
  \contenttable{\projecttitle}{#3}   %[4]
  \begin{list}{\char"2022}
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
