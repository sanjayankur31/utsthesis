%% utsthesis.cls
%% Copyright 2013 Ankur Sinha
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2013/06/25 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Ankur Sinha.
%
% This work consists of the files utsthesis.cls

\ProvidesClass{utsthesis}
\RequirePackage{graphicx}

% For drafts
\LoadClass[oneside,bindnopdf,ams,draft,hyper]{hepthesis}

% For soft bound
%\LoadClass[hyperpdf,bindnopdf]{hepthesis}

% For hard bound
%\LoadClass[hyperpdf,oneside]{hepthesis}

\let\@oldtitlepage\titlepage
\let\@oldendtitlepage\endtitlepage
\DeclareRobustCommand{\titlepage}[9]{%
  %\@oldtitlepage%
  \thispagestyle{empty}%
  \begingroup%
  \ifx\@sftitles\@empty\else\sf\fi%
  \begin{center}%
    \begin{figure}[h]
        \includegraphics[keepaspectratio,width=\textwidth]{uts-logo.jpg}
    \end{figure}
    \vspace*{\parskip}%
    %\begin{doublespace}%
      {\LARGE\textbf{Masters Candidature Assessment Report \hrule \vspace*{\baselineskip} \thetitle}}\\%
    %\end{doublespace}%
    \vspace*{5cm}%
    \begin{tabular}{r l}
        Student's name: & \theauthor \\
        Student number: & #1 \\
        Institution: & #2 \\
        Faculty: & #3 \\
        Center: & #4 \\
        Principal supervisor: & #5 \\
        Alternate supervisor: & #6 \\
        Commencement date: & #7 \\
        EWS date: & #8 \\
        Assessment date: & #9 \\
    \end{tabular}
    %\vspace*{8cm}%
  \end{center}%
  \endgroup%
  %\@oldendtitlepage%
  %\cleardoublepage%
}

