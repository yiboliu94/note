#
#  Developed by Sheldon Tan, UC Riverside
#  Change paper = xxx to the root name of the main latex file you want to compile
#
#  to use, type'make command', where command is the one of the tasks
#  in the makefile: dvi, pdf, paper, commit, update, clean 
#  The default command is 'dvi' when you type 'make' only.
#
PAPER = j_gridnetopt
#
FORMAT = letter
LATEX  = latex
BIBTEX = bibtex
DVI2PS= dvips
PS2PDF = ps2pdf14
GHOSTVIEW = gv
ACRO = acroread

# generate the bbl and dvi files , which is the default command when 
# type 'make'

dvi: $(PAPER).tex  
	$(LATEX) $(PAPER)
	$(BIBTEX) $(PAPER) 
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)

#just bbl file only 
bibtex: $(PAPER).tex  
	$(BIBTEX) $(PAPER) 

#only dvi file with existing bbl file.
dvionly: $(PAPER).tex  
	$(LATEX) $(PAPER)

# generate bbl and dvi and ps file
ps: $(PAPER).tex  
	$(LATEX) $(PAPER)
	$(BIBTEX) $(PAPER) 
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)
	$(DVI2PS) -Ppdf -G0 -t $(FORMAT) -o $(PAPER).ps $(PAPER)

# generate bbl, dvi, ps and pdf files
pdf: $(PAPER).tex  
	$(LATEX) $(PAPER)
	$(BIBTEX) $(PAPER) 
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)
	$(DVI2PS) -Ppdf -G0 -t $(FORMAT) -o $(PAPER).ps $(PAPER)
	$(PS2PDF) $(PAPER).ps

# same as the pdf command
paper: $(PAPER).tex  
	$(LATEX) $(PAPER)
	$(BIBTEX) $(PAPER) 
	$(LATEX) $(PAPER)
	$(LATEX) $(PAPER)
	$(DVI2PS) -Ppdf -G0 -t $(FORMAT) -o $(PAPER).ps $(PAPER)
#	$(GHOSTVIEW) -watch $(PAPER).ps &
	$(PS2PDF) $(PAPER).ps
#	$(ACRO) $(PAPER).pdf

#  check in something with the default message"add changes"
#
commit:
	git commit -am"add changes"
push:
	git push origin master

# get the status from git
status:
	git status

# pull from the master branch
pull:
	git pull origin master
#
#
# clean all the temp files
clean:
	rm -f *.aux *.dvi *.ps *.log *~ *.pdf *.bak *.blg core

