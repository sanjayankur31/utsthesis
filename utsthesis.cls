%%% ====================================================================
%%%  @LaTeX-class-file{
%%%	filename	= "utsthesis.cls",
%%%	version		= "0.1",
%%%	date		= "14 May 2014",
%%%	writtenby	= "Ankur Sinha",
%%%	email		= "ankur.sinha@student.uts.edu.au",
%%%	keywords	= "LaTeX, thesis, uts, utsthesis",
%%%	docstring	= "This file provides a thesis class for the
%%%			   University of Technology, Sydney, Australia."
%%% }
%%% ====================================================================

% This class is meant to be used for thesis to be submitted to the graduate 
% research school at the University of Technology, Sydney

% It is derived from John Zaitseff's utsthesis class.
%
% As with all class files, this class is meant to be used as the exclusive
% LaTeX-2e class for the entire document.  It may be introduced in the
% document via:
%
%       \documentclass{utsthesis}
%
% As always, options may be placed before the {utsthesis}.  In this case,
% the following options are supported:
%
%       singlespacing   - Single-space the document (ie, do not apply the
%                         thesis requirements).
%       doublespacing   - Double-space the document (actually, space it
%                         1.21 times the baseline).
%       draft           - Prints the word "DRAFT" across the front page,
%                         as well as on each page (in the footer).
%       final           - Opposite of draft: do not print "DRAFT".
%
% All of the options for the Book class are also supported, namely,
%       10pt, 11pt, 12pt             (11pt is used by default)
%       letterpaper, legalpaper,
%       executivepaper, a4paper,
%       a5paper, b5paper             (a4paper used by default)
%       landscape                    (not used by default)
%       oneside, twoside             (oneside used by default)
%       openright, openany           (openany used by default)
%       onecolumn, twocolumn         (onecolumn used by default)
%       openbib                      (not used by default)
%       leqn, fleqn                  (not used by default)
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utsthesis}%
  [2014/05/14 0.1 A thesis class for UTS, Sydney]
\RequirePackage{fancyheadings}
\RequirePackage{setspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Changeable Parameters   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Change these for customisation.  To change them in a LaTeX document,
% simply use \thesisuni{xxx} and \thesisschool{xxx}.

\gdef\@thesisuni{University of Technology, Sydney}

%%%%%%%%%%%%%%%%%%%%%
%   Class options   %
%%%%%%%%%%%%%%%%%%%%%

\newif\if@dspacing{}
\newif\if@thdraft{}
\newcommand\droptnm{final}

\DeclareOption{singlespacing}{\@dspacingfalse}
\DeclareOption{doublespacing}{\@dspacingtrue}
\DeclareOption{draft}{\@thdrafttrue\renewcommand\droptnm{draft}}
\DeclareOption{final}{\@thdraftfalse\renewcommand\droptnm{final}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{doublespacing,final}
\ProcessOptions
\LoadClass[a4paper,11pt,oneside,openany,\droptnm]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Draft / final options   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@thdraft%
    \RequirePackage[first,light]{draftcopy}%
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Double and single spacing   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ssp}{%
    \def\baselinestretch{1}%
    \large\normalsize\selectfont}
\newcommand{\dsp}{%
    \def\baselinestretch{1.21}%
    \large\normalsize\selectfont}

% Define conditional:

\if@dspacing%
    \newcommand\s@dsp{\dsp}%
\else%
    \newcommand\s@dsp{\ssp}%
\fi

% Conditional Double-spacing environment

\def\spacing{%
    \begingroup%
    \s@dsp}%
\def\endspacing{%
    \par \vskip \parskip \vskip \baselineskip%
    \endgroup%
    \vskip -\parskip%
    \vskip -\baselineskip}

% Always single-space

\def\sspacing{%
    \begingroup%
    \ssp}%
\def\endsspacing{%
    \par \vskip \parskip \vskip \baselineskip%
    \endgroup%
    \vskip -\parskip%
    \vskip -\baselineskip}

% Execute the following ONLY if double-spacing was selected.

\if@dspacing
    % The following are from "book.cls":
    \renewcommand{\mainmatter}{%
	\cleardoublepage\@mainmattertrue\pagenumbering{arabic}\s@dsp}
    \renewcommand{\backmatter}{%
	\if@openright\cleardoublepage\else\clearpage\fi%
	\@mainmatterfalse\ssp}
    \renewenvironment{figure}[1][tbp]{\@float{figure}[#1]\ssp}{\end@float\s@dsp}
    \renewenvironment{figure*}[1][tbp]{\@dblfloat{figure}[#1]\ssp}{\end@dblfloat\s@dsp}
    \renewenvironment{table}[1][tbp]{\@float{table}[#1]\ssp}{\end@float\s@dsp}
    \renewenvironment{table*}[1][tbp]{\@dblfloat{table}[#1]\ssp}{\end@dblfloat\s@dsp}

    % The following are from "latex.ltx". BUG: This is NOT single-spaced.

    \long\def\@footnotetext#1{\insert\footins{%
	\ssp%                  % Should be single-spaced, but...
	\reset@font\footnotesize
	\interlinepenalty\interfootnotelinepenalty
	\splittopskip\footnotesep
	\splitmaxdepth \dp\strutbox \floatingpenalty \@MM
	\hsize\columnwidth \@parboxrestore
	\protected@edef\@currentlabel{%
	    \csname p@footnote\endcsname\@thefnmark
	}%
	\color@begingroup
	    \@makefntext{%
		\rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}
	\color@endgroup}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Miscellaneous Commands   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareFontShape{OT1}{cmr}{bx}{sl}{<-> cmbxsl10}{}
\newcommand{\HUGE}{%
    \fontencoding{OT1}\fontfamily{cmr}%
    \fontseries{bx}\fontshape{sl}%
    \fontsize{36}{45}\selectfont}

\newcommand{\thesisschool}[1]{\gdef\@thesisschool{#1}}
\newcommand{\thesistitle}[1]{\gdef\@thesistitle{#1}}
\newcommand{\thesisauthor}[1]{\gdef\@thesisauthor{#1}}
\newcommand{\thesisstudentnumber}[1]{\gdef\@thesisstudentnumber{#1}}
\newcommand{\thesisdegree}[1]{\gdef\@thesisdegree{#1}}
\newcommand{\thesisdate}[1]{\gdef\@thesisdate{#1}}
\newcommand{\thesissupervisor}[1]{\gdef\@thesissupervisor{#1}}
\newcommand{\thesiscosupervisor}[1]{\gdef\@thesiscosupervisor{#1}}
\newcommand{\thesisEWS}[1]{\gdef\@thesisEWS{#1}}
\newcommand{\thesisassessor}[1]{\gdef\@thesisassessor{#1}}
\newcommand{\thesiscentre}[1]{\gdef\@thesiscentre{#1}}
\newcommand{\thesiscommencementdate}[1]{\gdef\@thesiscommencementdate{#1}}
\newcommand{\thesisassessmentdate}[1]{\gdef\@thesisassessmentdate{#1}}

\newcommand{\@thesisschool}{\@latex@error{No \noexpand\thesisschool given}\@ehc}
\newcommand{\@thesistitle}{\@latex@error{No \noexpand\thesistitle given}\@ehc}
\newcommand{\@thesisauthor}{\@latex@error{No \noexpand\thesisauthor given}\@ehc}
\newcommand{\@thesisstudentnumber}{\@latex@error{No \noexpand\thesisstudentnumber given}\@ehc}
\newcommand{\@thesisdegree}{\@latex@error{No \noexpand\thesisdegree given}\@ehc}
\newcommand{\@thesisdate}{\@latex@error{No \noexpand\thesisdate given}\@ehc}
\newcommand{\@thesissupervisor}{\@latex@error{No \noexpand\thesissupervisor given}\@ehc}
\newcommand{\@thesiscosupervisor}{\@latex@error{No \noexpand\thesiscosupervisor given}\@ehc}
\newcommand{\@thesisassessor}{\@latex@error{No \noexpand\thesisassessor given}\@ehc}
\newcommand{\@thesisEWS}{\@latex@error{No \noexpand\thesisEWS given}\@ehc}
\newcommand{\@thesiscentre}{\@latex@error{No \noexpand\thesiscentre given}\@ehc}
\newcommand{\@thesiscommencementdate}{\@latex@error{No \noexpand\thesiscommencementdate given}\@ehc}
\newcommand{\@thesisassessmentdate}{\@latex@error{No \noexpand\thesisassessmentdate given}\@ehc}

\renewcommand{\title}[1]{\@latex@warning{\noexpand\title is not used with this class}}
\renewcommand{\author}[1]{\@latex@warning{\noexpand\author is not used with this class}}
\renewcommand{\date}[1]{\@latex@warning{\noexpand\date is not used with this class}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Thesis front matter   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title page

\renewcommand{\maketitle}%
    {\begin{titlepage}%
	\begin{center}%
    \begin{doublespacing}%
    \begin{figure}[h]%
        \includegraphics[keepaspectratio,width=\textwidth]{uts-logo.jpg}%
    \end{figure}%
	    %{\Large \scshape \@thesisschool \par}%
	    %\vskip 7em%
    {\Huge\textbf{Masters Thesis Report\hrule \vspace*{\baselineskip} \LARGE\@thesistitle}\\}%
    \par\vspace*{\fill}
        \hrule
        {\large%
        \begin{tabular}{r l}%
            Student's name: & \@thesisauthor \\%
            Student number: & \@thesisstudentnumber \\%
            Institution: & \@thesisuni \\%
            Faculty: & \@thesisschool \\%
            Centre: & \@thesiscentre \\%
            Principal supervisor: & \@thesissupervisor \\%
            Alternate supervisor: & \@thesiscosupervisor \\%
            Commencement date: & \@thesiscommencementdate \\%
            EWS date: & \@thesisEWS \\%
            Assessment date: & \@thesisassessmentdate \\%
          \end{tabular}}%
        \hrule
%%	    {\Large \bfseries \@thesisauthor \par}%
%%	    \vskip .7em%
%%	    {\large \@thesisdegree \par}%
%%	    \vskip .7em%
%%	    {\large \@thesisdate \par}%
%%	    \vskip 8em%
%%	    {\large \textsl{\supervisorname}\ \@thesissupervisor \par}%
%%	    {\large \textsl{\assessorname}\ \@thesisassessor \par}%
    \end{doublespacing}%
	\end{center}\par
	\vfil\null
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \let\maketitle\relax}

% Abstract environment (not defined by "book.cls")

\newenvironment{abstract}{%
    \titlepage
    \null\vfil
    \begin{center}%
	{\Large \bfseries \abstractname}
	\@endparpenalty\@M
    \end{center}\spacing}%
    {\endspacing\par\vfil\null\endtitlepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   General Page Parameters   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The university requirements specify a 25mm border all around, except for
% the bottom (20mm). We actually increase this to make it more
% typographically correct. The page dimensions used were taken from "The
% LaTeX Companion", p. 85, with appropriate modifications.

%\setlength\oddsidemargin{15\p@}
%\setlength\evensidemargin{15\p@}
\setlength\oddsidemargin{30\p@}
\setlength\evensidemargin{30\p@}
\setlength\topmargin{15\p@}
\setlength\headsep{20\p@}
\setlength\headheight{20\p@}
%\setlength\footskip{40\p@}
\setlength\marginparwidth{15\p@}
\setlength\marginparsep{\z@}
\setlength\textwidth{\paperwidth %
    \advance\textwidth -144\p@ %
    \advance\textwidth -\oddsidemargin %
    \advance\textwidth -\marginparwidth %
    \advance\textwidth -\marginparsep}
\setlength\textheight{\paperheight %
    \advance\textheight -140\p@ %
    \advance\textheight -\topmargin %
    \advance\textheight -\headheight %
    \advance\textheight -\headsep %
    \advance\textheight -\footskip}

% Page headings and footers.

\pagestyle{fancyplain}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{\thechapter. #1}}
\renewcommand{\sectionmark}[1]{}
\lhead[\fancyplain{}{\bfseries\thepage}]{\fancyplain{}{\bfseries\rightmark}}
\rhead[\fancyplain{}{\bfseries\leftmark}]{\fancyplain{}{\bfseries\thepage}}
\cfoot{\fancyplain{\textrm{\thepage}}{}}

\if@thdraft
    \rfoot[\textbf{Draft:}~\today]{}
    \lfoot[]{\textbf{Draft:}~\today}
\fi
