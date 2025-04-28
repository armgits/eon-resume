% Eon Resume by Abhishekh Reddy (helloarm@pm.me)
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
\ProvidesClass{eon-literary}[2024/11/19 v1.0.0 Eon resume with literary style]

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
\RequirePackage{setspace}

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

% Typeface (Static)
\setmainfont{InriaSerif}
[
  Path = ./fonts/inria-serif/,
  Extension = .ttf,
  UprightFont = *-Regular,
  BoldFont = *-Bold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-BoldItalic,
  FontFace={mb}{n}{*-Bold}
]

% % Typeface (Variable)
% \setmainfont{Aleo}
% [
%   Path = ./fonts/aleo/,
%   Extension = .ttf,
%   UprightFont = *-Regular,
%   BoldFont = *-SemiBold,
%   ItalicFont = *-Italic,
%   BoldItalicFont = *-BoldItalic,
%   FontFace={mb}{n}{*-Medium},
%   FontFace={mb}{it}{*-MediumItalic}
% ]

% Spacing between resume sections
\setlength{\parskip}{4pt}

% Disables page numbers at the bottom
\thispagestyle{empty}

% Hyperlinks settings
\hypersetup
{
  colorlinks=true,
  linkcolor=black,
  filecolor=magenta,
  urlcolor=black,
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
  \def \firstname {#1}
  \def \lastname {#2}

  \def \personname {\firstname \ \lastname}
}

% Parameter #1 - Year of study
% Parameter #2 - Major
\newcommand{\academiclevel}[2]
{
  \def \academicyear {#1}
  \def \major {#2}

  \def \academiclvl {\academicyear \ in \major}
}

% Parameter #1 - Tagline content
\newcommand{\customtagline}[1]
{
  \def \cstmtagline {#1}
}

\newcommand{\city}[2]
{
  \def \cityname {#1}
  \def \statename {#2}

  \def \citylocation {\cityname,\ \statename}
}

% Parameter #1 - Email/Directory ID
% Parameter #2 - Domain
\newcommand{\email}[2]
{
  \def \emailaddress {\href{mailto:#1@#2}{#1@#2}}
}

% Parameter #1 - Domain
% Parameter #2 - Subdirectory and parameters
\newcommand{\website}[2]
{
  \def \websiteurl {\href{https://#1/#2}{#1/#2}}
}

% Parameter #1 - Country Code
% Parameter #2 - Phone Number
\newcommand{\phone}[2]
{
  \def \phonenumber{#1 #2}
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
    \parbox{\linewidth}{\raggedleft \large\websiteurl \\ \large\emailaddress \\ \smallskip\large\phonenumber}
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
  {\normalsize #1} & {\small #2}
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
    @{}>{\raggedright\arraybackslash\hsize=.75\hsize\linewidth=\hsize}X
    >{\raggedright\arraybackslash\hsize=1.5\hsize\linewidth=\hsize}X
  }
  %
  {\fontseries{mb}\selectfont #1} & #2
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
    {\fontseries{mb}\selectfont #1} \ #2
  } {
    % false
    \href{#3}{\fontseries{mb}\selectfont #1} \ #2
  }
}

% No Parameters
\newenvironment{workdetail-list}
{
  \begin{list}{\bf-}
  {
    \setlength{\leftmargin}{\widthof{ \ -}}
  }
}
{
  \end{list}
}

% Parameter #1 - URL
% Parameter #2 - Text to show
\newcommand{\link}[2] {\href{#1}{\it#2}}

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
  \def \sectiontitle {\Large{\fontseries{mb}\selectfont \title}}
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
  \contenttable{{\fontseries{mb}\selectfont #1} \ #2}{#3}
}
{}

\newenvironment{skills}
{
  % \setlength{\parskip}{0pt}
  \begin{list}{}
  {
    \normalsize
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{0pt}
    \setlength{\topsep}{2pt}
    \setlength{\parsep}{-2pt}
    % \setlength{\itemsep}{2pt}
    \setstretch{1.2}
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
    \def \worktitle {{\bf#1} \ #2}
  } {
    % false
    \def \worktitle {{\bf#1} \ #2, #3}
  }

  \setlength{\parskip}{0pt}
  \contenttable{\worktitle}{#4}   %[4]
  \begin{list}{\char"2022}
  {
    \normalsize
    \setlength{\leftmargin}{\widthof{ \ \char"2022}}
    \setlength{\topsep}{2pt}
    % \setlength{\parsep}{2pt}
    \setlength{\itemsep}{2pt}
    \setstretch{1.2}
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
    \def \projecttitle {\bf\projectname}
    } {
    % false
    \def \projecttitle {{\bf\projectname} \ #2}
  }

  \setlength{\parskip}{0pt}
  \contenttable{\projecttitle}{#3}   %[4]
  \begin{list}{\char"2022}
  {
    \normalsize
    \setlength{\parskip}{0pt}
    \setlength{\leftmargin}{\widthof{ \ \char"2022}}
    \setlength{\topsep}{2pt}
    \setlength{\parsep}{2pt}
    \setlength{\itemsep}{2pt}
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
