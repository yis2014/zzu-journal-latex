% SPDX-License-Identifier: MIT
% Copyright (c) 2026 The zzu-journal-latex contributors
% Independent LaTeX implementation; format sources are listed in docs/sources.md.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{zzueng}[2026/10/26 v1.2 Unofficial coursework layout]
\newif\ifzzu@coursework
\DeclareOption{coursework}{\zzu@courseworktrue}
\ProcessOptions\relax
\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{zzueng}{XeLaTeX is required}{Select XeLaTeX as the compiler.}
\fi
\LoadClass[UTF8,a4paper,zihao=5,scheme=chinese,fontset=none]{ctexart}
\RequirePackage{fontspec}
% Word font names are used where available. Fandol is included in TeX Live.
\IfFontExistsTF{SimSun}{
  \setCJKmainfont{SimSun}[AutoFakeBold=2.5]
  \setCJKmonofont{SimSun}
}{\setCJKmainfont{FandolSong-Regular.otf}[BoldFont=FandolSong-Bold.otf]
  \setCJKmonofont{FandolFang-Regular.otf}}
\IfFontExistsTF{SimHei}{
  \setCJKsansfont{SimHei}[AutoFakeBold=2.5]
  \setCJKfamilyfont{zzuhei}{SimHei}[AutoFakeBold=2.5]
}{
  \setCJKsansfont{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
  \setCJKfamilyfont{zzuhei}{FandolHei-Regular.otf}[BoldFont=FandolHei-Bold.otf]
}
\IfFontExistsTF{KaiTi}{
  \setCJKfamilyfont{zzukai}{KaiTi}[AutoFakeBold=2.5]
}{\setCJKfamilyfont{zzukai}{FandolKai-Regular.otf}[AutoFakeBold=2.5]}
\IfFontExistsTF{FangSong}{
  \setCJKfamilyfont{zzufang}{FangSong}[AutoFakeBold=2.5]
}{\setCJKfamilyfont{zzufang}{FandolFang-Regular.otf}[AutoFakeBold=2.5]}
\IfFontExistsTF{Times New Roman}{
  \setmainfont{Times New Roman}
}{\setmainfont{TeX Gyre Termes}}
\setsansfont{TeX Gyre Heros}
\setmonofont{Latin Modern Mono}[Scale=MatchLowercase]
\providecommand{\songti}{\CJKfamily{\CJKrmdefault}}
\providecommand{\heiti}{\CJKfamily{zzuhei}}
\providecommand{\kaishu}{\CJKfamily{zzukai}}
\providecommand{\fangsong}{\CJKfamily{zzufang}}

\RequirePackage[left=20mm,right=19mm,top=24mm,bottom=18mm,
  headheight=0pt,headsep=0pt,footskip=5mm]{geometry}
\setlength{\columnsep}{7.4mm}
\setlength{\columnseprule}{0pt}
\RequirePackage{amsmath,amssymb,bm}
% newtx's legacy math encodings require a matching Type1 operator font.
% Preserve the OpenType Times New Roman family for normal text.
\let\zzu@textfamily\rmdefault
\def\rmdefault{ntxtlf}
\RequirePackage{newtxmath}
\let\rmdefault\zzu@textfamily
\DeclareMathAlphabet{\mathsf}{OT1}{qhv}{m}{n}
\DeclareMathAlphabet{\mathtt}{OT1}{lmtt}{m}{n}
\RequirePackage{graphicx,booktabs,array,tabularx,multirow}
\RequirePackage{siunitx}
\sisetup{detect-all,group-minimum-digits=4,group-separator={\,},
  range-phrase={\text{～}},range-units=single}
\RequirePackage{upgreek}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{stfloats}
\RequirePackage{cuted}
\RequirePackage{flushend}
\RequirePackage{needspace}
\RequirePackage{enumitem}
\RequirePackage[numbers,super,square,sort&compress]{natbib}
\RequirePackage{xurl}
\RequirePackage{etoolbox}
% Full-width strips can collide with two-column floats in some output layouts.
% In documents using floats, finish those pages before English end matter.
\newif\ifzzu@hasfloats
\AtBeginEnvironment{figure}{\global\zzu@hasfloatstrue}
\AtBeginEnvironment{figure*}{\global\zzu@hasfloatstrue}
\AtBeginEnvironment{table}{\global\zzu@hasfloatstrue}
\AtBeginEnvironment{table*}{\global\zzu@hasfloatstrue}
\RequirePackage[hidelinks,unicode]{hyperref}
\pdfstringdefDisableCommands{\def\zzuaffmark#1{}\def\\{ }}
\urlstyle{same}
\graphicspath{{images/}}
\def\ps@plain{%
  \let\@mkboth\@gobbletwo
  \let\@oddhead\@empty\let\@evenhead\@empty
  \def\@oddfoot{\hfil\normalfont\fontsize{9bp}{12bp}\selectfont\thepage\hfil}%
  \let\@evenfoot\@oddfoot}
\pagestyle{plain}
\raggedbottom
% ctex's Chinese scheme defaults to a 1.3 multiplier. The Word grid values
% below are already complete baseline distances, so do not multiply again.
\linespread{1}
\setlength{\parskip}{0pt}
\setlength{\emergencystretch}{1em}
\postdisplaypenalty=10000
\renewcommand{\normalsize}{\@setfontsize\normalsize{10.5bp}{15.7bp}%
  \abovedisplayskip=7bp plus 2bp minus 2bp
  \belowdisplayskip=7bp plus 2bp minus 2bp
  \abovedisplayshortskip=3bp plus 2bp
  \belowdisplayshortskip=5bp plus 2bp minus 2bp}
\renewcommand{\small}{\@setfontsize\small{9bp}{12bp}}
\renewcommand{\footnotesize}{\@setfontsize\footnotesize{9bp}{12bp}}
\AtBeginDocument{\normalsize\setlength{\parindent}{2\ccwd}}
\ctexset{
  section={format=\heiti\bfseries\fontsize{14bp}{20bp}\selectfont,
    name={},number=\arabic{section},aftername=\hspace{.7em},
    beforeskip=12bp,afterskip=6bp,indent=0pt},
  subsection={format=\heiti\bfseries\normalsize,
    aftername=\hspace{.7em},beforeskip=7bp,afterskip=3bp,indent=0pt},
  subsubsection={format=\kaishu\normalsize,
    aftername=\hspace{.7em},beforeskip=5bp,afterskip=2bp,indent=0pt}
}
\setcounter{secnumdepth}{3}
\setlist[enumerate]{label=（\arabic*）,leftmargin=2em,labelsep=0pt,
  itemindent=0pt,itemsep=0pt,topsep=3bp,parsep=0pt}
\DeclareCaptionFont{zzucaption}{\fontsize{9bp}{12bp}\selectfont\heiti\bfseries}
\captionsetup{font=zzucaption,labelsep=quad,skip=4bp,
  justification=centering,singlelinecheck=false}
\captionsetup[table]{position=top}
\captionsetup[sub]{font=small,labelfont=normalfont,skip=2bp}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\newcommand{\zzucaption}[2]{%
  \caption{#1}%
  {\par\centering\normalfont\rmfamily\fontsize{9bp}{12bp}\selectfont\bfseries
    \ifx\@captype\@undefined\else
      \ifdefstring{\@captype}{figure}{Figure~\thefigure}{Table~\thetable}%
    \fi\quad #2\par}\vspace{3bp}}
\setlength{\textfloatsep}{9bp plus 2bp minus 2bp}
\setlength{\floatsep}{9bp plus 2bp minus 2bp}
\setlength{\intextsep}{9bp plus 2bp minus 2bp}
\setlength{\dbltextfloatsep}{9bp plus 2bp minus 2bp}
\renewcommand{\topfraction}{.90}
\renewcommand{\bottomfraction}{.65}
\renewcommand{\textfraction}{.08}
\renewcommand{\dbltopfraction}{.90}
\renewcommand{\floatpagefraction}{.80}
\renewcommand{\dblfloatpagefraction}{.80}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{5}

% Editable front matter. Blank optional fields are omitted.
\def\zzu@title{}\def\zzu@author{}\def\zzu@affiliation{}
\def\zzu@abstract{}\def\zzu@keywords{}
\def\zzu@articleid{}\def\zzu@clc{}\def\zzu@doctype{A}\def\zzu@doi{}
\def\zzu@received{}\def\zzu@revised{}\def\zzu@funding{}
\def\zzu@bio{}\def\zzu@corresponding{}\def\zzu@citation{}
\def\zzu@entitle{}\def\zzu@enauthor{}\def\zzu@enaffiliation{}
\def\zzu@enabstract{}\def\zzu@enkeywords{}
\newcommand{\zzutitle}[1]{\gdef\zzu@title{#1}}
\newcommand{\zzuauthor}[1]{\gdef\zzu@author{#1}}
\newcommand{\zzuaffiliation}[1]{\gdef\zzu@affiliation{#1}}
\newcommand{\zzuabstract}[1]{\gdef\zzu@abstract{#1}}
\newcommand{\zzukeywords}[1]{\gdef\zzu@keywords{#1}}
\newcommand{\zzuarticleid}[1]{\gdef\zzu@articleid{#1}}
\newcommand{\zzuclc}[1]{\gdef\zzu@clc{#1}}
\newcommand{\zzudoctype}[1]{\gdef\zzu@doctype{#1}}
\newcommand{\zzudoi}[1]{\gdef\zzu@doi{#1}}
\newcommand{\zzureceived}[1]{\gdef\zzu@received{#1}}
\newcommand{\zzurevised}[1]{\gdef\zzu@revised{#1}}
\newcommand{\zzufunding}[1]{\gdef\zzu@funding{#1}}
\newcommand{\zzuauthorbio}[1]{\gdef\zzu@bio{#1}}
\newcommand{\zzucorresponding}[1]{\gdef\zzu@corresponding{#1}}
\newcommand{\zzucitation}[1]{\gdef\zzu@citation{#1}}
\newcommand{\zzuentitle}[1]{\gdef\zzu@entitle{#1}}
\newcommand{\zzuenauthor}[1]{\gdef\zzu@enauthor{#1}}
\newcommand{\zzuenaffiliation}[1]{\gdef\zzu@enaffiliation{#1}}
\newcommand{\zzuenabstract}[1]{\gdef\zzu@enabstract{#1}}
\newcommand{\zzuenkeywords}[1]{\gdef\zzu@enkeywords{#1}}
\newcommand{\zzuaffmark}[1]{\textsuperscript{#1}}
\newcommand{\zzu@noteline}[2]{\ifx#1\@empty\else
  \noindent{\heiti #2：}#1\par\fi}
\newcommand{\zzu@firstnote}{%
  \ifboolexpr{test {\ifdefempty{\zzu@received}} and
    test {\ifdefempty{\zzu@revised}} and test {\ifdefempty{\zzu@funding}} and
    test {\ifdefempty{\zzu@bio}} and test {\ifdefempty{\zzu@corresponding}} and
    test {\ifdefempty{\zzu@citation}}}{}{%
  % An unnumbered full-width bottom float reproduces Word's title footnote.
  % stfloats permits it at the bottom of the first two-column page.
  \begin{figure*}[!b]
    \small\songti\setlength{\parindent}{0pt}
    \noindent\rule{.34\textwidth}{.4pt}\par\vspace{2bp}
    \ifx\zzu@received\@empty\else
      \noindent{\heiti 收稿日期：}\zzu@received
      \ifx\zzu@revised\@empty\else；\fi
    \fi
    \ifx\zzu@revised\@empty\else
      {\heiti 修订日期：}\zzu@revised
    \fi\par
    \zzu@noteline\zzu@funding{基金项目}
    \zzu@noteline\zzu@bio{作者简介}
    \zzu@noteline\zzu@corresponding{通信作者}
    \zzu@noteline\zzu@citation{引用本文}
  \end{figure*}}}
\renewcommand{\maketitle}{%
  \hypersetup{pdftitle={\zzu@title},pdfauthor={\zzu@author}}%
  \twocolumn[{%
    \parindent=0pt\normalfont
    \ifzzu@coursework
      \ifx\zzu@articleid\@empty\else
        {\small\noindent 课程作业：\zzu@articleid\par}\vspace{9bp}
      \fi
    \else
      {\small\noindent 文章编号：\zzu@articleid\par}\vspace{9bp}
    \fi
    {\centering\heiti\bfseries\fontsize{18bp}{26bp}\selectfont
      \zzu@title\par}\vspace{10bp}
    {\centering\fangsong\bfseries\fontsize{14bp}{20bp}\selectfont
      \zzu@author\par}\vspace{8bp}
    {\centering\small\songti\zzu@affiliation\par}\vspace{8bp}
    \begin{list}{}{\setlength{\leftmargin}{3\ccwd}%
      \setlength{\rightmargin}{2\ccwd}\setlength{\topsep}{0pt}%
      \setlength{\parsep}{3bp}\setlength{\itemsep}{0pt}}
      \item[]\fontsize{9bp}{16.3bp}\selectfont
      {\heiti\bfseries 摘要：}{\kaishu\zzu@abstract}\par
      {\heiti\bfseries 关键词：}{\songti\zzu@keywords}\par
      \ifzzu@coursework\else
      {\heiti\bfseries 中图分类号：}\zzu@clc\quad
      {\heiti\bfseries 文献标志码：}\zzu@doctype\quad
      \ifx\zzu@doi\@empty\else\textbf{doi: }\zzu@doi\fi\par
      \fi
    \end{list}\vspace{12bp}
  }]%
  \zzu@firstnote\normalsize\songti}

\renewcommand{\bibsection}{\section*{参考文献：}}
\renewcommand{\bibfont}{\fontsize{9bp}{15.7bp}\selectfont\songti}
\setlength{\bibsep}{0bp}
\renewcommand{\bibnumfmt}[1]{[#1]}
% The current downloadable template and the older sample use different orders.
% Arguments remain {English}{Chinese}; template is the current default.
\newif\ifzzu@samplebib
\newcommand{\zzubibstyle}[1]{%
  \ifstrequal{#1}{sample}{\zzu@samplebibtrue}{%
    \ifstrequal{#1}{template}{\zzu@samplebibfalse}{%
      \ClassError{zzueng}{Unknown bibliography style '#1'}{Use template or sample.}}}}
\newcommand{\zzubilingualref}[2]{%
  \ifzzu@samplebib #2\par\nobreak #1\else #1\par\nobreak[\,#2\,]\fi}
\newcommand{\zzuacknowledgements}[1]{\par\vspace{5bp}%
  \noindent{\heiti\bfseries 致谢：}#1\par}
\newcommand{\zzudataavailability}[1]{\par\vspace{5bp}%
  \noindent{\heiti\bfseries 数据可用性声明：}#1\par}
\newcommand{\zzu@englishblock}{%
  \begingroup\fontsize{9bp}{16.3bp}\selectfont\setlength{\parindent}{0pt}
    {\centering\bfseries\fontsize{12bp}{17bp}\selectfont
      \zzu@entitle\par}\vspace{12bp}
    {\centering\bfseries\zzu@enauthor\par}\vspace{12bp}
    {\centering\zzu@enaffiliation\par}\vspace{10bp}
    \noindent\textbf{Abstract: }\zzu@enabstract\par\vspace{5bp}
    \noindent\textbf{Keywords: }\zzu@enkeywords\par
  \endgroup}
\newsavebox{\zzu@englishbox}
\NewDocumentCommand{\makeenglishabstract}{s}{%
  % Both source Word documents use a continuous single-column section here.
  % The starred form remains available for a deliberately separate page.
  \IfBooleanTF{#1}{%
    \par\flushcolsend\onecolumn\raggedcolsend\zzu@englishblock
  }{%
    \ifzzu@hasfloats
      \par\flushcolsend\onecolumn\raggedcolsend\zzu@englishblock
    \else
    \par
    \if@twocolumn
      \setbox\zzu@englishbox=\vbox{\hsize=\textwidth\zzu@englishblock}%
      \ifdim\dimexpr\ht\zzu@englishbox+\dp\zzu@englishbox+2\stripsep\relax>\textheight
        % An unusually long block must be allowed to split across pages.
        \flushcolsend\onecolumn\raggedcolsend\zzu@englishblock
      \else
      \if@firstcolumn
        \Needspace{\dimexpr\ht\zzu@englishbox+\dp\zzu@englishbox+2\stripsep\relax}%
      \else
        \Needspace{\dimexpr2\ht\zzu@englishbox+2\dp\zzu@englishbox+4\stripsep\relax}%
      \fi
      \raggedend
      \begin{strip}\begin{minipage}{\textwidth}
        \zzu@englishblock
      \end{minipage}\end{strip}%
      \fi
    \else\zzu@englishblock\fi\fi}}
% Semantic math helpers: quantities italic; units and descriptive subscripts upright.
\newcommand{\dif}{\mathop{}\!\mathrm{d}}
\newcommand{\eu}{\mathrm{e}}
\newcommand{\iu}{\mathrm{i}}
