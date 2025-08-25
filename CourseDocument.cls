%UPDATED 2024-12-16

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CourseDocument}

\RequirePackage{etoolbox} 
\newtoggle{Math}
\newtoggle{Multisection}

\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption{multisection}{
  \toggletrue{Multisection} % uses plural forms of \IWe, \MyOur commands (see DEFINITIONS: Plural/singular)
}

\DeclareOption{math}{
  \toggletrue{Math} % include Math
}

\DeclareOption{comments}{
  \def\Solutions{1} 
  \def\MyComments{1} 
}

\ProcessOptions\relax

\LoadClass[]{article}  

% Fakesection BASIC PACKAGES
%NOTE: load geometry package in document for flexibility
\RequirePackage{parskip} %no indent, skips line between paragraphs
\RequirePackage[inline]{enumitem}
\RequirePackage{xspace} %see DEFINITIONS: Plural/singular
\RequirePackage[table,dvipsnames]{xcolor} 
\RequirePackage{soul}  %for strikeouts
\RequirePackage[most]{tcolorbox}
\RequirePackage[]{fancyhdr}
\RequirePackage{geometry}
\newlength{\alphabet} % Will be used to set textwidth
\settowidth{\alphabet}{\normalfont abcdefghijklmnopqrstuvwxyz}
%\geometry{showframe}
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


% Fakesection TABLES
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{multirow}

\iftoggle{Math}{
  \RequirePackage{MathStuff} % custom_package
}{}

% Fakesection FONTS
% Newtx: Family, times clone (ntxtosf), helvetica clone (qhv), and monospaced (ntxtt). Mono has bold style, and italic shape.
\let\CheckCommand\providecommand % https://tex.stackexchange.com/questions/511711/disable-microtype-warning
\RequirePackage[tracking = true]{microtype} %makes pdflatex do cleaner typesetting?
%\RequirePackage[scaled=1.0]{newtxtext} %Options: osf gives oldstylefigures in text but not math; useosf no longer necessary; helvratio (default 0.9) defines scaling of sans relative to roman
%\RequirePackage[T1]{fontenc}
%\RequirePackage[scaled=1.0,cmbraces,varg,nosymbolsc]{newtxmath} %see documentation for varg or varvw; option nosymbolsc frees up a math font slot, but disables \Diamond, \Join, \leadsto; 
% Libertine family: has roman (libertine), sans (biilinum), teletype (libertinemono), each of which can be loaded independently: \usepackage{libertineRoman}, or biolinum, or libertineMono. Has shapes it, sc, scit (\textsc{\emph{}}) in all family except mono which has only it
\usepackage[sb]{libertine} %Options: sb for semibold for roman, no effect on sans (very subtle, is it even working?), oldstyle (Note: will also affect math), lining (default), proportional, tabular (default) for figures, along with commands \oldstylenums{}, \oldstylenumsf{},\liningnums{}, \liningnumsf{}, scale (for biolinum), llscale (for libertine), ttscale (for mono)
%\RequirePackage{arev}
\usepackage[]{ClearSans}
\usepackage[]{inconsolata}
\usepackage[T1]{fontenc}
\usepackage[libertine,scaled=1.0,nosymbolsc,cmbraces,libaltvw,liby]{newtxmath} %libertine option disables varvw
%\useosf  % for osf in normal text; load after math package


% Fakesection TITLES, SECTIONS
\RequirePackage{titling}
\RequirePackage{titlesec}
\setcounter{secnumdepth}{3}
%\RequirePackage{titletoc}

\newcommand{\doctitle}[1]{%
  \noindent\Huge\sffamily\bfseries\color{Black!40!OliveGreen}
  #1
  \vskip0.1ex\normalsize\normalfont\color{Black}
}
\newcommand{\subtitle}[1]{%
  \noindent\Large\sffamily
  #1
  \vskip0.1ex\normalsize\normalfont
}

\setlength{\droptitle}{-5em}
\pretitle{\noindent\Huge\sffamily\bfseries\color{Black!40!OliveGreen}}
\posttitle{\par\color{Black}}
\preauthor{\noindent\Large\sffamily}
\postauthor{\par}
\predate{\noindent\itshape}
\postdate{\par}
%\postdate{\vskip -2em}

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

  % Fakesubsection DEFINITIONS: Plural/singular
  \iftoggle{Multisection}{
    \def\IWe{We\xspace}
    \def\Iwe{we\xspace}
    \def\myour{our\xspace}
    \def\MyOur{Our\xspace}
    \def\meus{us\xspace}
    \def\amare{are\xspace}
    \def\instructorinstructors{instructors\xspace}
    \def\InstructorInstructors{Instructors\xspace}
  }{
    \def\IWe{I\xspace}
    \def\Iwe{I\xspace}
    \def\myour{my\xspace}
    \def\MyOur{My\xspace}
    \def\meus{me\xspace}
    \def\amare{am\xspace}
    \def\instructorinstructors{instructor\xspace}
    \def\InstructorInstructors{Instructor\xspace}
  }
} %END AtEndOfClass
