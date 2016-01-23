% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SIMPLE-RESUME-CV
%% <https://github.com/zachscrivena/simple-resume-cv>
%% This is free and unencumbered software released into the
%% public domain; see <http://unlicense.org> for details.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleresumecv}[2016/01/23 Simple Resume CV https://github.com/zachscrivena/simple-resume-cv]

\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{article}}

% Draft mode.
\newcommand{\TypesetInDraftMode}{0}
\DeclareOption{draft}{\renewcommand{\TypesetInDraftMode}{1}}

% Run in non-stop mode
\DeclareOption{nonstop}{\nonstopmode}

% Datestamp format (default): {yyyy}{MM}{dd} ---> MMM yyyy (e.g., Dec 2010).
\newcommand{\DatestampYMD}[3]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
\newcommand{\DatestampY}[1]{#1}
\DeclareOption{MMMyyyy}{} % default

% Datestamp format: {yyyy}{MM}{dd} ---> dd MMM yyyy (e.g., 31 Dec 2010).
\DeclareOption{ddMMMyyyy}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#3 \ShortMonth{#2} #1}}
\renewcommand{\DatestampYM}[2]{\mbox{\ShortMonth{#2} #1}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> MMMM yyyy (e.g., December 2010).
\DeclareOption{MMMMyyyy}{%
\renewcommand{\DatestampYMD}[3]{\mbox{\LongMonth{#2} #1}}
\renewcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> dd MMMM yyyy (e.g., 31 December 2010).
\DeclareOption{ddMMMMyyyy}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#3 \LongMonth{#2} #1}}
\renewcommand{\DatestampYM}[2]{\mbox{\LongMonth{#2} #1}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy-MM-dd (e.g., 2010-12-31).
\DeclareOption{yyyyMMdd}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#1-#2-#3}}
\renewcommand{\DatestampYM}[2]{\mbox{#1-#2}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy-MM (e.g., 2010-12).
\DeclareOption{yyyyMM}{%
\renewcommand{\DatestampYMD}[3]{\mbox{#1-#2}}
\renewcommand{\DatestampYM}[2]{\mbox{#1-#2}}
\renewcommand{\DatestampY}[1]{#1}}

% Datestamp format: {yyyy}{MM}{dd} ---> yyyy (e.g., 2010).
\DeclareOption{yyyy}{%
\renewcommand{\DatestampYMD}[3]{#1}
\renewcommand{\DatestampYM}[2]{#1}
\renewcommand{\DatestampY}[1]{#1}}

\ProcessOptions\relax

% Use article class as the base class.
\LoadClass[10pt,oneside]{article}

% Geometry package for page margins.
\RequirePackage[
left=0.70in,
right=0.70in,
top=0.60in,
bottom=0.45in,
nohead,
includefoot]{geometry}

% PDF settings and properties.
\RequirePackage{hyperref}

% Long table for page layout.
\RequirePackage{longtable}

% Hyphenation: Disabled.
\RequirePackage[none]{hyphenat}

% Colors.
\RequirePackage[usenames]{color}
% \definecolor{MyDarkBlue}{RGB}{0,90,160}
% {\color{MyDarkBlue}This text is dark blue}

% Current date and time.
\RequirePackage[yyyymmdd,24hr]{datetime}
\renewcommand{\dateseparator}{-}
\settimeformat{xxivtime}
% {\today}~{\currenttime}

% Timestamp.
\newcommand{\Timestamp}{{\yyyymmdddate\today}~{\currenttime}}

% Abbreviations for months.
\newcommand{\LongMonth}[1]{%
\ifcase#1\relax
\or January%
\or February%
\or March%
\or April%
\or May%
\or June%
\or July%
\or August%
\or September%
\or October%
\or November%
\or December%
\fi}
\newcommand{\ShortMonth}[1]{%
\ifcase#1\relax
\or Jan%
\or Feb%
\or Mar%
\or Apr%
\or May%
\or Jun%
\or Jul%
\or Aug%
\or Sep%
\or Oct%
\or Nov%
\or Dec%
\fi}

% XeLaTeX packages.
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

% Font: Use "Tinos" as the main typeface (\textnormal{}, \normalfont).
% The "Tinos" fonts are released under the Apache License Version 2.0,
% and can be downloaded for free at <http://www.fontsquirrel.com/fonts/tinos>.
% Symbol table: <http://www.fileformat.info/info/unicode/font/tinos/grid.htm>
\setmainfont
[Path=./Fonts/Tinos/,
ItalicFont=Tinos-Italic,
BoldFont=Tinos-Bold,
BoldItalicFont=Tinos-BoldItalic]
{Tinos-Regular.ttf}

% Secondary font: "GNU FreeFont".
% The "GNU FreeFont" fonts are released under the
% GNU General Public License Version 3, and can be downloaded
% for free at <https://savannah.gnu.org/projects/freefont/>.
\newcommand{\UseSecondaryFont}{\fontspec
[Path=./Fonts/GNUFreeFont/,
ItalicFont=FreeSerifItalic,
BoldFont=FreeSerifBold,
BoldItalicFont=FreeSerifBoldItalic]
{FreeSerif.otf}}

% Sans-serif font: Changed to "Tinos".
\renewcommand{\sffamily}{\rmfamily}

% Typewriter (monospace) font: Changed to "Tinos".
\renewcommand{\ttfamily}{\rmfamily}

% Small caps font: Changed to "Tinos".
\renewcommand{\scshape}{\rmfamily}
%\renewcommand{\textsc}[1]{\textbf{\MakeUppercase{#1}}}

% Font styles.
\newcommand{\UseHeadingFont}{\normalfont}
\newcommand{\UseHeaderFooterFont}{\UseHeadingFont\fontsize{8.2pt}{9.5pt}\selectfont}
\newcommand{\UseNoteFont}{\UseHeadingFont\fontsize{8pt}{9.6pt}\selectfont}
\newcommand{\UseTitleFont}{\UseHeadingFont\fontsize{28pt}{33.6pt}\selectfont\bfseries}
\newcommand{\UseSubTitleFont}{\normalfont\fontsize{8.6pt}{10.3pt}\selectfont}
\newcommand{\UseSectionFont}{\UseHeadingFont\fontsize{9pt}{11pt}\selectfont\bfseries}
\newcommand{\UseSubSectionFont}{\UseHeadingFont\fontsize{8.6pt}{10.3pt}\selectfont\bfseries}
\newcommand{\UseDetailFont}{\normalfont\fontsize{8.6pt}{10.3pt}\selectfont}

% Symbols (unicode).
\newcommand{\BulletSymbol}{{\normalfont\fontsize{6.5}{7.8}\selectfont\raisebox{0.17em}{\char"25A0}}}
\newcommand{\SubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CF}}}
\newcommand{\TildeSymbol}{{\normalfont\char"007E}}

% Headers and footers: Blank header, page number in footer.
\AtEndDocument{\null\label{LastPage}}
\newcommand{\PageKOfN}{{\UseHeaderFooterFont{Page}~\thepage~of~\pageref{LastPage}}}
\newcommand{\DraftStamp}{{\UseHeaderFooterFont\color{red}DRAFT~\Timestamp}}
\newcommand{\ExtraMargin}{\hspace{2.0mm}}

\ifnum\TypesetInDraftMode=0
\newcommand{\HeaderText}{}
\newcommand{\FooterText}{\hfill\PageKOfN\hfill}
\else
\newcommand{\HeaderText}{}
\newcommand{\FooterText}{\null\ExtraMargin\hphantom{\DraftStamp}\hfill%
\PageKOfN\hfill%
\DraftStamp\ExtraMargin\null}
\fi

\def\ps@plain{%
\def\@oddhead{\HeaderText}%
\def\@evenhead{\HeaderText}%
\def\@oddfoot{\FooterText}%
\def\@evenfoot{\FooterText}}

\pagestyle{plain}

% Paragraph style.
\setlength{\parindent}{0in} % No indentation at the beginning of each paragraph.
\setlength{\parskip}{0in} % No vertical space between paragraphs.

% Footnotes: Use symbols instead of numbers for labels.
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Macro: title (name).
\renewcommand{\title}[1]{%
\pdfbookmark[1]{#1}{#1}%
\par\begin{center}%
\par\UseTitleFont%
{#1}%
\par\end{center}%
\par\vspace{-1.75em}\par}

% Macro: subtitle (personal information below name).
\newenvironment{subtitle}
{\par\begin{center}%
\par\UseSubTitleFont}
{\par\end{center}\par}

% Macro: body (rest of the document).
\newenvironment{body}
{\par\vspace{-1em}\par
\begin{longtable}{p{0.15\textwidth}p{0.80\textwidth}}}
{\par\end{longtable}\par}

% Macro: section (new section for Education, Research Experience, etc.).
\renewcommand{\section}[3]{\\[-1em]\pdfbookmark[2]{#2}{#3}\\%
{\UseSectionFont\raggedright\MakeUppercase{#1}}%
&}

% Macro: subsection.
\renewcommand{\subsection}[3]{\par~\vskip-\baselineskip%
\pdfbookmark[3]{#2}{#3}\par%
{\UseSubSectionFont\raggedright\MakeUppercase{#1}}%
\vspace{0.225\baselineskip}}

% Macro: BigGap, BigGapNoBreak (big vertical gap between items in the same section).
\newcommand{\BigGap}{\\[-1.75mm]~&}
\newcommand{\BigGapNoBreak}{\par\vspace{2.45mm}\par}

% Macro: Gap, GapNoBreak (vertical gap between items in the same section).
\newcommand{\Gap}{\\[-3.5mm]~&}
\newcommand{\GapNoBreak}{\par\vspace{0.7mm}\par}

% Macro: detail (text in smaller font under an item).
\newenvironment{detail}
{\par\begingroup\UseDetailFont}
{\par\endgroup\par}

% Macro: BulletItem.
\newsavebox{\BulletItemIndentation}
\newlength{\BulletItemIndentationWidth}
\newcommand{\BulletItem}{\par%
\savebox{\BulletItemIndentation}{\hspace{1.5mm}\BulletSymbol\hspace{1.25mm}}%
\settowidth{\BulletItemIndentationWidth}{\usebox{\BulletItemIndentation}}%
\noindent\hangafter=1\hangindent=\BulletItemIndentationWidth\ignorespaces%
\usebox{\BulletItemIndentation}\ignorespaces}

% Macro: SubBulletItem.
\newsavebox{\SubBulletItemIndentation}
\newlength{\SubBulletItemIndentationWidth}
\newcommand{\SubBulletItem}{\par%
\savebox{\SubBulletItemIndentation}{\hspace{5.6mm}\SubBulletSymbol\hspace{1.25mm}}%
\settowidth{\SubBulletItemIndentationWidth}{\usebox{\SubBulletItemIndentation}}%
\noindent\hangafter=1\hangindent=\SubBulletItemIndentationWidth\ignorespaces%
\usebox{\SubBulletItemIndentation}\ignorespaces}

% Macro: Item.
\newsavebox{\ItemIndentation}
\newlength{\ItemIndentationWidth}
\newcommand{\Item}{\par%
\savebox{\ItemIndentation}{\hphantom{\hspace{1.5mm}\BulletSymbol\hspace{1.25mm}}}%
\settowidth{\ItemIndentationWidth}{\usebox{\ItemIndentation}}%
\noindent\hangafter=1\hangindent=\ItemIndentationWidth\ignorespaces%
\usebox{\ItemIndentation}\ignorespaces}

% Macro: SubItem.
\newsavebox{\SubItemIndentation}
\newlength{\SubItemIndentationWidth}
\newcommand{\SubItem}{\par%
\savebox{\SubItemIndentation}{\hphantom{\hspace{1.5mm}\BulletSymbol\hspace{1.25mm}}}%
\settowidth{\SubItemIndentationWidth}{\usebox{\SubItemIndentation}}%
\noindent\hangafter=1\hangindent=\SubItemIndentationWidth\ignorespaces%
\usebox{\SubItemIndentation}\ignorespaces}

% Macro: NumberedItem.
\newsavebox{\NumberedItemIndentation}
\newlength{\NumberedItemIndentationWidth}
\newcommand{\NumberedItem}[1]{\par%
\savebox{\NumberedItemIndentation}{{#1}\hspace{2.3mm}}%
\settowidth{\NumberedItemIndentationWidth}{\usebox{\NumberedItemIndentation}}%
\noindent\hangafter=1\hangindent=\NumberedItemIndentationWidth\ignorespaces%
\usebox{\NumberedItemIndentation}\ignorespaces}

% Macro: CharSpace (for aligning single-digit numbers).
\newlength{\CharWidth}
\newcommand{\CharSpace}{\settowidth{\CharWidth}{8}\hspace{\CharWidth}}

% Macro: Hide.
\newcommand{\Hide}[1]{}

% End of class file.
\endinput
