% Eon Resume by Abhishekh Reddy (helloarm@pm.me)
%
% HUGE Inspiration from: Dheera Venkatraman's resume https://dheera.net/about
% and Microsoft's Metro UI
%
% Repository: https://github.com/armgits/eon-resume
% License: TBD

% ------------------------------------------------------------------------------
% Preamble
% ------------------------------------------------------------------------------

% ------------------------------------------------------------------------------
% Class Identification
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eon-contemporary}[2024/11/19 v1.0.0 Eon resume with contemporary style]

% ------------------------------------------------------------------------------
% Base Class + Packages
% ------------------------------------------------------------------------------
\let \lowercaseheadings \relax
\DeclareOption{lowercaseheadings} {\def \lowercaseheadings {}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass{extarticle}

\RequirePackage{etoolbox}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage[parfill]{parskip}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{calc}

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
  Path = ./fonts/d-din/,
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
  pdftitle={Resume - Abhishekh Reddy},
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
\let \citylocation \relax

% Parameter #1 - First name
% Parameter #2 - Last name
\newcommand{\name}[2]
{
  \ifundef{\lowercaseheadings} {
    % true
    \def \firstname {#1}
    \def \lastname {#2}
  } {
    % false
    \def \firstname {\lowercase{#1}}
    \def \lastname {\lowercase{#2}}
  }

  \def \personname {{\bf\firstname} \textcolor{gray-2}{\lastname}}
}

% Parameter #1 - Year of study
% Parameter #2 - Major
\newcommand{\academiclevel}[2]
{
  \ifundef{\lowercaseheadings} {
    % true
    \def \academicyear {#1}
    \def \major {#2}
  } {
    % false
    \def \academicyear {\lowercase{#1}}
    \def \major {\lowercase{#2}}
  }

  \def \academiclvl {\lowercase{\textcolor{gray-2}{\academicyear \ in} \major}}
}

% Parameter #1 - Tagline content
\newcommand{\customtagline}[1]
{
  \ifundef{\lowercaseheadings} {
    % true
    \def \cstmtagline {#1}
  } {
    % false
    \def \cstmtagline {\lowercase{#1}}
  }
}

\newcommand{\city}[2]
{
  \ifundef{\lowercaseheadings} {
    % true
    \def \cityname {#1}
    \def \statename {#2}
  } {
    % false
    \def \cityname {\lowercase{#1}}
    \def \statename {\lowercase{#2}}
  }

  \def \citylocation {\lowercase{\cityname,\ \textcolor{gray-2}{\statename}}}
}

% Parameter #1 - Email/Directory ID
% Parameter #2 - Domain
\newcommand{\email}[2]
{
  \def \emailaddress {\href{mailto:#1@#2}{\textcolor{black}{#1}\textcolor{gray-2}{@#2}}}
}

% Parameter #1 - Domain
% Parameter #2 - Subdirectory and parameters
\newcommand{\website}[2]
{
  \def \websiteurl {\href{https://#1/#2}{\textcolor{gray-2}{#1/}\textcolor{black}{#2}}}
}

% Parameter #1 - Country Code
% Parameter #2 - Phone Number
\newcommand{\phone}[2]
{
  \def \phonenumber{\textcolor{gray-2}{#1} {#2}}
}

\newcommand{\printheader}
{
  % Sets the tagline under the name based on this priority when multiple fields are defined:
  % City > Academic Level > Custom Text

  \let \tagline \relax
  \ifundef{\citylocation} {
    \ifundef{\cstmtagline} {
      % true
      \def \tagline {\academiclvl}
    } {
      % false
      \def \tagline {\cstmtagline}
    }
  } {
    \def \tagline {\citylocation}
  }

  \begingroup
  \renewcommand{\arraystretch}{1.25}
  \begin{center}
  \begin{tabularx}{\linewidth}
  % layout (auto column-width)  [1]
  {
    @{}>{\raggedright\arraybackslash}X  % column 1
    >{\raggedleft\arraybackslash}X@{} % column 2
  }
  % table content
  \ifundef{\phonenumber} {
    % true
    \parbox{\widthof{\huge\personname}}{\huge\personname \\ \Large\tagline} &
    \parbox{\linewidth}{\raggedleft\Large\websiteurl \\ \Large\emailaddress}
  }{
    % false
    \parbox{\widthof{\huge\personname}}{\huge\personname \\ \Large\tagline} &
    \parbox{\linewidth}{\raggedleft\large\websiteurl \\ \large\emailaddress \\ \large\phonenumber}
  }
  %
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
% Resume Body
% ------------------------------------------------------------------------------

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
  %
  {\normalsize #1} & {\small\textcolor{gray-2}{#2}}
  %
  \end{tabularx}
  \end{center}
}

% Parameter #1 - Skill Category
% Parameter #2 - Particular Skills
\newcommand{\skill}[2]
{
  \setlength{\parskip}{0pt}
  \begin{center}
  \begin{tabularx}{\linewidth}
  % table layout
  {
    @{}>{\raggedright\arraybackslash\hsize=.6\hsize\linewidth=\hsize}X
    >{\raggedright\arraybackslash\hsize=1.5\hsize\linewidth=\hsize}X
  }
  %
  #1 & \textcolor{gray-3}{#2}
  %
  \end{tabularx}
  \end{center}
}

% Parameter #1 - Title / Keyword
% Parameter #2 - Brief Description
% Parameter #3 - URL
\newcommand{\workdetail}[3]
{
  \ifblank{#3} {
    % true
    {\bf \textcolor{gray-2}{#1}} \ #2
  } {
    % false
    \href{#3}{\bf \textcolor{gray-2}{#1}} \ #2
  }
}

% No Parameters
\newenvironment{workdetail-list}
{
  \begin{list}{\bf-}
  {
    \setlength{\leftmargin}{\widthof{ \ -}}
    \normalsize
  }
}
{
  \end{list}
}

% Parameter #1 - URL
% Parameter #2 - Text to show
\newcommand{\link}[2] {\href{#1}{#2}}


% ------------------------------------------------------------------------------
% Section Definition
% ------------------------------------------------------------------------------
% Parameter #1 - Section Title
\renewenvironment{section}[1]
{
  \ifundef{\lowercaseheadings} {
    % true
    \def \title {#1}
  } {
    % false
    \def \title {\lowercase{#1}}
  }
  %
  \def \sectiontitle {\Large{\bf{\textcolor{gray-2}{\title}}}}
  %
  \sectiontitle
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
  \normalsize
}
{}

\newenvironment{skills}
{
  \setlength{\parskip}{0pt}
  \begin{list}{}
  {
    \normalsize
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{0pt}
    \setlength{\topsep}{2pt}
    \setlength{\parsep}{-3pt}
    \setlength{\itemsep}{2pt}
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
    \normalsize
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{\widthof{ \ \char"2022}}
    \setlength{\topsep}{4pt}
    \setlength{\parsep}{2pt}
  }
}
{
  \end{list}
}

% Parameter #1 - Project Title
% Parameter #2 - Keywords
% Parameter #3 - Dates
% Parameter #4 - Project Link
\newenvironment{project}[4]
{
  \let \projectname \relax
  \let \projecttitle \relax

  \ifblank{#4} {
    % true
    \def \projectname {#1}
  } {
    % false
    \def \projectname {\href{#4}{\textcolor{black}{#1}}}
  }

  \ifblank{#2} {
    % true
    \def \projecttitle {\projectname}
  } {
    % false
    \def \projecttitle {\projectname \ \textcolor{gray-2}{- #2}}
  }

  \setlength{\parskip}{0pt}
  \contenttable{\projecttitle}{#3}   %[4]
  \begin{list}{\char"2022}
  {
    \normalsize
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{\f@size pt}
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
