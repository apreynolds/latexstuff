%UPDATED 2024-10-02 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CourseNotes}

% Fakesection Load class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax
\LoadClass[17pt]{extarticle}  

\DeclareOption{comments}{
\def\MyComments{1} 
\def\Solutions{1} 
}
\ProcessOptions\relax

% Fakesection Basic packages
\RequirePackage{etoolbox}
\RequirePackage[inline]{enumitem}
\RequirePackage[skip=1em]{parskip} %no indent (works in tex4ht), skips line between paragraphs
\RequirePackage[top=7mm,bottom=7mm,left=10mm,right=10mm,letterpaper]{geometry}
\RequirePackage{graphicx}
\PassOptionsToPackage{dvipsnames,table}{xcolor}
\RequirePackage{xcolor}
\RequirePackage{soul} 
\RequirePackage[most]{tcolorbox}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{ifthen}
\RequirePackage{systeme}
\RequirePackage{siunitx}
%\RequirePackage[onehalfspacing]{setspace}
%\RequirePackage[normalem]{ulem} %for strikeouts (sout) (exsheets also loads, so load this before exsheets)

% Fakesection FONTS AND SYMBOLS

\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage[tracking = true]{microtype} %makes pdflatex do cleaner typesetting?
\RequirePackage[scaled=1.0]{newtxtext} %provides roman, ss, tt variants.
\RequirePackage[varqu,varl,scaled=0.95]{zi4}% inconsolata; teletype font
\RequirePackage[scaled=0.9]{helvet} %provides only ss, obviously
\renewcommand*\sfdefault{phv} %if package teletype is not desirable
\RequirePackage[scaled=1.0,bigdelims,vvarbb]{newtxmath} % load after amsthm. Not compatible with fouriernc. Use option libertine if main font is libertine.
%\useosf % A newtx option. old style figures for text, not math (e.g. changes ntxlf to ntxosf); not defined for all fonts.
\RequirePackage[scaled=1.0,cal=euler, bb=ams, frak=euler, scr=boondoxo]{mathalfa} %lots of variants possible here
\RequirePackage{bm} %load after all to give access to bold math; not always necessary, but spacing is apparently better

% Fakesection TITLES
\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{2}


%\setlength{\droptitle}{-5em}
\pretitle{\noindent\huge\sffamily\bfseries}
%\posttitle{\par\vskip 0.5em}
\posttitle{\par}
\preauthor{\noindent\Large\sffamily}
\postauthor{\par}
\predate{\noindent\itshape}
\postdate{}


%usage: titleformat{command}[shape]
%{format}
%{label}{sep}{before-code}[after-code]
\titleformat{\section}[block]
{\sffamily\bfseries\Large}
{\thesection}{0.7em}{}[]

\titleformat{\subsection}[block]
{\sffamily\bfseries\large}
{\thesection}{0.7em}{}[]

\titleformat{\subsubsection}[block]
{\sffamily\bfseries\itshape}
{\thesection}{1em}{}[]

%\titlecontents{psection}[1em]
%{}
%{\bfseries\thecontentslabel. \normalfont \enspace }
%{\normalfont\enspace}
%{ \titlerule*[0.2pc]{.} \bfseries \thecontentspage}[\vspace{-0.5em}]  % Using this titlerule produces

%\titlecontents{psubsection}[2.5em]
%{\small}
%{\thecontentslabel. \enspace }
%{\enspace}
%{\hfill  \thecontentspage}[\vspace{-0.5em}]

%\titlecontents{psubsubsection}[3.5em]
%{\small}
%{\thecontentslabel. \enspace }
%{\enspace}
%{\hfill \thecontentspage}[]

\titlecontents{section}[1em]
{}
%{\bfseries}
{\bfseries\thecontentslabel. \normalfont \enspace }
{\normalfont\enspace}
{ \titlerule*[0.8pc]{.} \bfseries \thecontentspage}[]  

\titlecontents{subsection}[2.5em]
{\small}
{\thecontentslabel. \enspace }
{\enspace}
{\hfill  \thecontentspage}[]

\titlecontents{subsubsection}[3.5em]
{\small}
{\thecontentslabel. \enspace }
{\enspace}
{\hfill \thecontentspage}[]

%USAGE: \titlespacing*{command}{left}{before-sep}{after-sep}[right-sep]
\titlespacing*{\section}{0em}{2em}{1em}[0em]
\titlespacing*{\subsection}{0pt}{1.0em}{1.0em}
\titlespacing*{\subsubsection}{0pt}{1em}{0.3em}
\contentsmargin{1em}
%\renewcommand\contentsname{Table of Contents}

% Fakesection AtEndOfClass

\AtEndOfClass{

  \RequirePackage{IfThenBoxes} %custom_package
\colorlet{MyGreen}{Green!70!Black}

\newcommand\ns{\normalsize}
\newcommand*{\lsim}{\mathord{\sim}} %for use of tilde as negation
\everymath{\displaystyle}
\newcommand\important[1]{%
  {\sffamily\bfseries\textcolor{RoyalBlue}{#1}}
} 

% Fakesubsection FROM APEX CALC PreText


%% (From  docinfo/macros  element)
%% Plus three from PTX for XML characters
\newcommand{\highlight}[1]{{\color{blue}{#1}}}
\newcommand{\apex}{\mbox{\hbox{A}\kern -1pt \lower -2pt\hbox{P}\kern -4pt \lower .7ex\hbox{E}\kern -1pt \hbox{X}}}
\newcommand{\colorlinecolor}{blue!95!black!30}
\newcommand{\bwlinecolor}{black!30}
\newcommand{\thelinecolor}{\colorlinecolor}
\newcommand{\colornamesuffix}{}
\newcommand{\linestyle}{[thick, \thelinecolor]}
\newcommand{\bmx}[1]{\left[\hskip -3pt\begin{array}{#1} }
\newcommand{\emx}{\end{array}\hskip -3pt\right]}
\newcommand{\ds}{\displaystyle}
\newcommand{\fp}{f'}
\newcommand{\fpp}{f''}

\newcommand{\lz}[2]{\frac{d#1}{d#2}}
\newcommand{\lzn}[3]{\frac{d^{#1}#2}{d#3^{#1}}}
\newcommand{\lzo}[1]{\frac{d}{d#1}}
\newcommand{\lzoo}[2]{{\frac{d}{d#1}}{\left(#2\right)}}
\newcommand{\lzon}[2]{\frac{d^{#1}}{d#2^{#1}}}
\newcommand{\lzoa}[3]{\left.{\frac{d#1}{d#2}}\right|_{#3}}
\newcommand{\plz}[2]{\frac{\partial#1}{\partial#2}}
\newcommand{\plzoa}[3]{\left.{\frac{\partial#1}{\partial#2}}\right|_{#3}}

\newcommand{\inflim}[1][n]{\lim\limits_{#1 \to \infty}}

\newcommand{\infser}[1][1]{\sum_{n=#1}^\infty}

\newcommand{\Fp}{F\primeskip'}
\newcommand{\Fpp}{F\primeskip''}
\newcommand{\yp}{y\primeskip'}
\newcommand{\gp}{g\primeskip'}
\newcommand{\dx}{\Delta x}
\newcommand{\dy}{\Delta y}
\newcommand{\ddz}{\Delta z}
\newcommand{\thet}{\theta}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\vnorm}[1]{\left\lVert\vec #1\right\rVert}
\newcommand{\snorm}[1]{\left|\left|\,#1\,\right|\right|}
\newcommand{\la}{\left\langle}
\newcommand{\ra}{\right\rangle}
\newcommand{\dotp}[2]{\vec #1 \cdot \vec #2}
\newcommand{\proj}[2]{\text{proj}_{\,\vec #2}{\,\vec #1}}
\newcommand{\crossp}[2]{\vec #1 \times \vec #2}
\newcommand{\veci}{\vec i}
\newcommand{\vecj}{\vec j}
\newcommand{\veck}{\vec k}
\newcommand{\vecu}{\vec u}
\newcommand{\vecv}{\vec v}
\newcommand{\vecw}{\vec w}
\newcommand{\vecx}{\vec x}
\newcommand{\vecy}{\vec y}
\newcommand{\vrp}{\vec r\hskip0.75pt '}
\newcommand{\vrpp}{\vec r\hskip0.75pt ''}
\newcommand{\vsp}{\vec s\hskip0.75pt '}
\newcommand{\vrt}{\vec r(t)}
\newcommand{\vst}{\vec s(t)}
\newcommand{\vvt}{\vec v(t)}
\newcommand{\vat}{\vec a(t)}
\newcommand{\px}{\partial x}
\newcommand{\py}{\partial y}
\newcommand{\pz}{\partial z}
\newcommand{\pf}{\partial f}
\newcommand{\unittangent}{\vec{{}T}}
\newcommand{\unitnormal}{\vec{N}}
\newcommand{\unittangentprime}{\vec{{}T}\hskip0.75pt '}
\newcommand{\mathN}{\mathbb{N}}
\newcommand{\surfaceS}{\mathcal{S}}
\newcommand{\zerooverzero}{\ds \raisebox{8pt}{\text{``\ }}\frac{0}{0}\raisebox{8pt}{\textit{ ''}}}
\newcommand{\deriv}[2]{\myds\frac{d}{dx}\left(#1\right)=#2}
\newcommand{\myint}[2]{\myds\int #1\, dx= {\ds #2}}
\newcommand{\primeskip}{\hskip.75pt}
\newcommand{\abs}[1]{\left\lvert #1\right\rvert}
\newcommand{\sech}{\operatorname{sech}}
\newcommand{\csch}{\operatorname{csch}}
\newcommand{\curl}{\operatorname{curl}}
\newcommand{\divv}{\operatorname{div}}
\newcommand{\Hess}{\operatorname{Hess}}
\newcommand{\lt}{<}
\newcommand{\gt}{>}
\newcommand{\amp}{&}
%% End: Author-provided macros

% Fakesubsection BOXES (theorems, etc)


% CAUTION Box
\newtcolorbox{caution}[1][]{enhanced,
  before skip=2mm,after skip=3mm,
  boxrule=0.4pt,left=5mm,right=2mm,top=1mm,bottom=1mm,
  colback=yellow!30,
  colframe=yellow!20!black,
  sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
  underlay={%
    \path[fill=tcbcolback!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[fill=Red,draw=none] (interior.south west) rectangle node[white]{\LARGE\bfseries !} ([xshift=4mm]interior.north west);
    }
  }

\newtcolorbox{prepwork}{%
 enhanced,
 colframe=MyGreen,
 colbacktitle=MyGreen,
 colback=Green!15,
 coltitle=White,
 boxrule=3pt,
 top=16pt,
 left=6pt,
 right=6pt,
 bottom=6pt,
 outer arc=0pt,
 arc=0pt,
 fonttitle=\bfseries,
 attach boxed title to top left={xshift=18pt,yshift=-\tcboxedtitleheight/2},
 boxed title style={outer arc=0pt,top=3pt,bottom=3pt,colback=MyGreen},
 title={\sffamily\bfseries PREPWORK\ldots }
}
\newtcolorbox{summary}{%
 enhanced,
 colframe=MyGreen,
 colbacktitle=MyGreen,
 colback=Green!15,
 coltitle=White,
 boxrule=3pt,
 top=16pt,
 left=6pt,
 right=6pt,
 bottom=6pt,
 outer arc=0pt,
 arc=0pt,
 fonttitle=\bfseries,
 attach boxed title to top right={xshift=-18pt,yshift=-\tcboxedtitleheight/2},
 boxed title style={outer arc=0pt,top=3pt,bottom=3pt,colback=MyGreen},
 title={\sffamily\bfseries \ldots SUMMARY}
}

%red box for checking in (flashcards)
\newtcolorbox{checkingin}{%
 enhanced,
 colframe=Red,
 colbacktitle=Red,
 colback=White,
 coltitle=White,
 boxrule=2.5pt,
 top=16pt,
 left=6pt,
 right=6pt,
 outer arc=0pt,
 arc=0pt,
 fonttitle=\bfseries,
 attach boxed title to top left={xshift=18pt,yshift=-\tcboxedtitleheight/2},
 boxed title style={outer arc=0pt,top=3pt,bottom=3pt,colback=Red},
 title={\sffamily\bfseries CHECKING IN }
}

\newtcolorbox{bluebox}[1][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.8pt,
 bottomtitle=1.8pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=White,
 fonttitle=\bfseries,
 title={\sffamily #1}
}

\newtcolorbox{greenbox}[1][]{%
 colframe=OliveGreen,
 colbacktitle=MyGreen,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.8pt,
 bottomtitle=1.8pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=White,
 fonttitle=\bfseries,
 title={\sffamily #1}
}

\newtcolorbox{graybox}[1][]{%
 colframe=Black!70,
 colbacktitle=Black!15,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{definition}[2][]{%
 colframe=Gray!60,
 colbacktitle=Gray!7,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  Definition \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{axiom}[2][]{%
 colframe=Black,
 colbacktitle=Black!20,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  AXIOM \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}

%theorem box setup
\newtcolorbox{conjecture}[2][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue!7,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 fontupper=\itshape,
 title={%
  Conjecture \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{lemma}[2][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue!7,
 fontupper=\itshape,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  Lemma \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{proposition}[2][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue!20,
 fontupper=\itshape,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  Proposition \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{theorem}[2][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue!20,
 fontupper=\itshape,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  Theorem \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{corollary}[2][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue!7,
 fontupper=\itshape,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  Corollary \ifthenelse{\equal{#2}{}}{}{#2.} \ifthenelse{\equal{#1}{}}{}{\mdseries\itshape(#1)}
 }
}
\newtcolorbox{thmbox}[2][]{%
 colframe=RoyalBlue,
 colbacktitle=RoyalBlue!20,
 left=6pt,
 right=6pt,
 boxrule=0.8pt,
 toptitle=1.3pt,
 bottomtitle=0.6pt,
 outer arc=0pt,
 arc=0pt,
 colback=White,
 coltitle=Black,
 fonttitle=\bfseries,
 title={%
  #2 \ifthenelse{\equal{#1}{}}{}{\sffamily\bfseries#1}
 }
}

% Fakesubsection FLASHCARD LETTERS
\newcommand{\mcA}{\setlength{\fboxsep}{8pt}\colorbox[RGB]{247,244,58}{\sffamily\textbf{A}}\quad\setlength{\fboxsep}{2pt}}
\newcommand{\mcB}{\setlength{\fboxsep}{8pt}\colorbox[RGB]{123,104,238}{\sffamily\textcolor{white}{\textbf{B}}}\quad\setlength{\fboxsep}{2pt}}
\newcommand{\mcC}{\setlength{\fboxsep}{8pt}\colorbox[RGB]{247,58,241}{\sffamily\textcolor{white}{\textbf{C}}}\quad\setlength{\fboxsep}{2pt}}
\newcommand{\mcD}{\setlength{\fboxsep}{8pt}\colorbox[RGB]{118,247,58}{\sffamily\textbf{D}}\quad\setlength{\fboxsep}{2pt}}
\newcommand{\mcE}{\setlength{\fboxsep}{8pt}\colorbox[RGB]{247,165,58}{\sffamily\textcolor{white}{\textbf{E}}}\quad\setlength{\fboxsep}{2pt}}
\newcommand{\mcextra}{\setlength{\fboxsep}{8pt}\colorbox{Gray}{\sffamily\textcolor{Gray}{\textbf{E}}}\quad\setlength{\fboxsep}{2pt}}

} %AtEndOfClass

% Fakesection AtEndPreamble: HYPERREF  2022-09-08 added, copid from stackexchange and changed linkcolor
\AtEndPreamble{%
\RequirePackage{hyperref}
\hypersetup{%
      colorlinks    = true,%  Color text instead of boxes
      %linkcolor     = Black!20!OliveGreen,% Color of internal links
      linkcolor     = black,% Color of internal links
      citecolor     = black,% Color of citations
      urlcolor      = RoyalBlue,%  Color of external urls
      pdfstartview  = Fit,%
      pdfmenubar    = true,%
      pdftoolbar    = true,%
      bookmarksopen = false,%
      %bookmarksopenlevel = 1,%
    }
  }
