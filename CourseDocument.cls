\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CourseDocument}[2025-08-25]

% Fakesection TOGGLES and OPTIONS
\RequirePackage{etoolbox} 
\newtoggle{Math}
\newtoggle{LegalPaper}
\newtoggle{NiceMargins}
\newtoggle{Git}

\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption{math}{
  \toggletrue{Math} % include Math
}

\DeclareOption{legal}{
  \toggletrue{LegalPaper} 
}

\DeclareOption{nicemargins}{
  \toggletrue{NiceMargins} 
}

\DeclareOption{git}{
  \toggletrue{Git} 
}

\DeclareOption{comments}{
  \def\Solutions{1} 
  \def\MyComments{1} 
}

\ProcessOptions\relax

% Fakesection LOAD CLASS
\LoadClass[]{article}  

% Fakesection TITLE and SUBTITLE
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{}%

\def\maketitle{%
  \par{\huge\bfseries\sffamily\color{Black!40!OliveGreen}\@title}
  \vspace{0.5em}
  \par{\Large\sffamily \@subtitle}
  \par{\small\itshape Updated \@date \space at \DTMcurrenttime}
  \vspace{0.5em}
}

% Fakesection BASIC PACKAGES

%\RequirePackage{showframe} %no indent, skips line between paragraphs
\RequirePackage{parskip} %no indent, skips line between paragraphs
\RequirePackage[inline]{enumitem}
\RequirePackage[dvipsnames]{xcolor} 
\RequirePackage{soul}  %for strikeouts
\RequirePackage[most]{tcolorbox}
% Fakesection GEOMETRY
\RequirePackage{geometry}
\iftoggle{NiceMargins}{
  \newlength{\alphabet} % Will be used to set textwidth
  \settowidth{\alphabet}{\normalfont abcdefghijklmnopqrstuvwxyz}
  \geometry{textwidth=2.6\alphabet}
  \geometry{head=15pt}
  %\geometry{twoside}
  \makeatletter
  \if@twoside
    \geometry{hmarginratio={2:3}}
  \else
    \geometry{hmarginratio={1:1}}
  \fi
  \makeatother
  \geometry{marginparwidth=0.7\dimexpr\paperwidth-1.0in-\hoffset-\oddsidemargin - \textwidth\relax}
}{}
\iftoggle{LegalPaper}{
  \geometry{legalpaper}
}{}


% Fakesection TABLES
\usepackage[]{tabularray}
\UseTblrLibrary{booktabs}
\usepackage[]{changepage}

% Fakesection MATH STUFF
\iftoggle{Math}{
  \RequirePackage{MathStuff} % custom_package
}{}
\RequirePackage[]{xfrac} %for nice fractions

% Fakesection FONTS
% Fakesubsection TYPEFACE SELECTIONS
\let\CheckCommand\providecommand % https://tex.stackexchange.com/questions/511711/disable-microtype-warning
\RequirePackage[tracking = true]{microtype} %makes pdflatex do cleaner typesetting; doesn't need to be loaded after font anymore.

\RequirePackage[T1]{fontenc}

% SERIF:
\RequirePackage[
semibold,
lining,
serif, %prevents loading sans serif
tt=false %prevents loading mono
]{libertinus} %libertinus-type1 

% SANS:
\RequirePackage[
sf,sflining,scaled=0.85
]{merriweather} %scaled roughly halfway between matching lowercase x (0.8) and uppercase X (0.9)

% TELETYPE:
\RequirePackage[
scale=0.96
]{newtxtt}

% MATH:
\RequirePackage[
libertinus, libaltvw, liby, 
amsthm,
nosymbolsc, cmbraces, smallerops, timesmathacc, upint,
scaled=1.0
]{newtxmath} 

% Fakesubsection TYPEFACE-DEPENDENT STUFF:
\newcommand{\course}[2][MATH]{%
  {#1 #2}%
}
\AtBeginEnvironment{tabular}{\LibertinusSerifTLF}
\renewcommand*{\oldstylenums}[1]{{\LibertinusSerifOsF #1}}
\newcommand*{\liningnums}[1]{{\LibertinusSerifTLF #1}}
%\useosf  % for osf in normal text; load after math package

% Fakesection TITLES, SECTIONS
\RequirePackage{titlesec}
\setcounter{secnumdepth}{3}
%\RequirePackage{titletoc}

%usage: titleformat{command}[shape]{format}{label}{sep}{before-code}[after-code]

\titleformat{\section}[block]
{\LARGE\sffamily\bfseries\color{Black!20!OliveGreen}}{\thesection.}{0.3em}{}
\titlespacing*{\section}
{0pt}{6ex plus 1ex minus .2ex}{3ex plus .2ex}

\titleformat{\subsection}[block]
{\Large\sffamily\bfseries\color{Black!20!OliveGreen}}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}
{0pt}{4.5ex plus 1ex minus .2ex}{2ex plus .2ex}

\titleformat{\subsubsection}[block]
{\sffamily\bfseries\itshape\color{Black!20!OliveGreen}}{\thesubsubsection}{0.5em}{}
\titlespacing*{\subsection}
{0pt}{4.5ex plus 1ex minus .2ex}{2ex plus .2ex}

% Fakesection FANCYHDR
\RequirePackage[]{fancyhdr}

\fancypagestyle{myfancy}{
  \renewcommand{\headrulewidth}{0.4pt}
  \fancyhf{}
  \fancyhead[R]{{\scshape\nouppercase{\leftmark}}}
  \fancyfoot[C]{\thepage}
  \iftoggle{Git}{
    \fancyfoot[R]{\fbox{\ttfamily\tiny\today \space \space (\gitVer{})}}
  }{}
}

\fancypagestyle{toc}{
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  %\fancyhead[R]{{\scshape\nouppercase{Hi There}}}
  \iftoggle{Git}{
    \fancyfoot[R]{\fbox{\ttfamily\tiny\today \space \space (\gitVer{})}}
  }{}
  \fancyfoot[C]{\thepage}
}

% Fakesection FUZZ
\hfuzz 2pt
\overfullrule 25pt
\vfuzz 2pt
\hbadness=500
\vbadness=1000

% Fakesection AtEndOfClass
\AtEndOfClass{

  \RequirePackage{IfThenBoxes} %custom_package

  % Fakesubsection HYPERREF
  \RequirePackage{hyperref}
  \hypersetup{%
    colorlinks    = true,%  Color text instead of boxes
    linkcolor     = Black!20!OliveGreen,% Color of internal links
    citecolor     = black,% Color of citations
    urlcolor      = Black!20!RoyalBlue,%  Color of external urls
    pdfstartview  = Fit,%
    pdfmenubar    = true,%
    pdftoolbar    = true,%
    bookmarksopen = false,%
    %bookmarksopenlevel = 1,%
  }

  \newcommand*{\fullautoref}[1]{\hyperref[{#1}]{\autoref*{#1} \nameref*{#1}}} % One single link
  \newcommand*{\fullref}[1]{\hyperref[{#1}]{\ref*{#1} \nameref*{#1}}} % One single link

} %END AtEndOfClass
% Fakesection AtBeginDocument
\AtBeginDocument{
% Fakesection DATETIME
  \RequirePackage[en-GB]{datetime2}
  \DTMlangsetup[en-GB]{ord=raise,monthyearsep={,\space}}
  % Fakesection gitver
  \iftoggle{Git}{
    \RequirePackage[noheader]{gitver}
  }{}


} %END AtBeginDocument
