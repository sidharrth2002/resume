% Intro Options
% From 2021/05/30 Abdullah's version
\ProvidesClass{resume-openfont}[2021/06/15]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%--------------------------------------------------------------
% Package Imports
\RequirePackage[english]{babel}
% page setup 
\RequirePackage{fancyhdr}
% Set boundaries
\RequirePackage[hmargin=1cm, vmargin=0.7cm]{geometry}
% remove ugly boxes around links
\usepackage[hidelinks]{hyperref}
% setup custom titles
\RequirePackage{titlesec}
% For skills table
\RequirePackage{enumitem}
% Using tables like the profile section
\RequirePackage{tabularx}
% Used for the link symbol
\RequirePackage{fontawesome}
% Set up font 
\RequirePackage{lato-font}
\RequirePackage{raleway-font}
%--------------------------------------------------------------
% Reformatting default sections
% section
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{%
\color{headings}% Using comments to allow us to split the command across multiple line
\scshape%
\customLatoLight%
\fontsize{12pt}{16pt}%first number is size, second number is space between lines
\selectfont%
\raggedright%
\uppercase%
} {}{0em}{}

% subsection
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titleformat{\subsection}{%
\color{subheadings}%
\customLatoBlack%
\fontsize{10pt}{14pt}%
\selectfont%
\bfseries%
% \uppercase%
\normalfont% Normal font is used to reset the customization, so it doesn't bleed into anything else
} {}{0em}{}

% remove header footer stuff like page numbers 
\newcommand{\resetHeaderAndFooter}{%
\fancyhf{}%
\fancyfoot{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}
%--------------------------------------------------------------
% Formatting commands - commands to control spacing

% A shortcut to control spacing
\newcommand{\NoSpace}{\vspace*{-2pt}}

% Command to simulate new line, to fix spacing glitches
\newcommand{\fakeNewLine}{\newline \vspace{-\baselineskip}}

% Command to align table at the start of the resume
\newcommand{\alignProfileTable}{
    \raggedbottom
    \raggedright
    \setlength{\tabcolsep}{0in}
}

%--------------------------------------------------------------
% Subheadings command - create different types of heading
\newcommand{\runsubsection}[1]{%
\color{subheadings}%
\customLatoBlack%
\fontsize{10pt}{13pt}%
\selectfont%
\bfseries%
#1%
\normalfont}%

% Descriptors command
\newcommand{\descript}[1]{%
\color{subheadings}%
\raggedright%
\scshape%
\customRalewayMedium%
\fontsize{10pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Location command
\newcommand{\location}[1]{%
\color{headings}%
\raggedright%
\customRalewayMedium%
\fontsize{10pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Minor command - like even smaller sub section
\newcommand{\minorSection}[1]{%
\color{subheadings}%
\raggedright%
\scshape%
\customRalewayMedium%
\fontsize{10pt}{10pt}%
\selectfont{#1}%
\normalfont}

% Project command
\newcommand{\Project}[2]{
\runsubsection{%
\href{#2}{{#1} \,\faExternalLink}
}
    \hfill
}

% Command for table 
\newcommand{\singleItem}[2]{\normalsize{\textbf{#1} #2}}
\newcommand{\doubleItem}[4]{\singleItem{#1}{#2} & \singleItem{#3}{#4}}

%--------------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{7pt}}

%--------------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{
    \vspace{-1mm}
    \begin{itemize}
    \itemsep1pt 
    \parskip1.5pt 
    \parsep1.5pt
    }{
        \end{itemize}
        \vspace{-\topsep}
    }

% Bullet Lists with fewer gaps command
\newenvironment{tightenumerate}{
    \vspace{-1mm}
    \begin{enumerate}
    \itemsep1pt 
    \parskip1.5pt 
    \parsep1.5pt
    }{
        \end{enumerate}
        \vspace{-\topsep}
    }


% Command for skill table
\newenvironment{resumeSkillList}{%
\noindent%
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%
}{%
\end{tabular*}%
}

%--------------------------------------------------------------
% Customize built-in commands
% Align Sections
\let\oldSection\section
\renewcommand{\section}[1]{\oldSection{#1}\raggedright}