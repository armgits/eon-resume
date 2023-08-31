\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eon-resume}[2023/08/29 v0.1.0 Minimal, futuristic, text-based resume.]

\LoadClass{article}

\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage[parfill]{parskip}

\geometry{
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

\newcommand{\name}[2]{
  \def \personname {{\bf#1} #2}
}

\newcommand{\academiclvl}[2]{
  \def \academiclevel {#1 in {\bf#2}}
}

\newcommand{\email}[1]{
  \def \emailaddress {#1}
}

\newcommand{\website}[1]{
  \def \websiteurl {#1}
}

\newcommand{\printinfo}{
  \begin{center}
  \begin{tabularx}{\textwidth} {
    >{\raggedright\arraybackslash}X 
    >{\raggedleft\arraybackslash}X
  }
    \huge\personname & \Large\emailaddress \\
    \Large\academiclevel & \Large\websiteurl
  \end{tabularx}
  \end{center}
}