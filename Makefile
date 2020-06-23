ROOT_FILE=srs
PROJECT_NAME=open-diablo-2-srs
AUX_DIR=aux
OUTPUT_DIR=output

all:
	# make sure output dir is there...
	mkdir -p ${OUTPUT_DIR}
	mkdir -p ${AUX_DIR}

	# generate pdf, then generate glossary, then redo to add glossary
	make tex
	make glossary
	make tex

tex:
	lualatex \
	--file-line-error \
	--aux-directory=aux \
	--output-directory=${AUX_DIR} ${ROOT_FILE}.tex && \
	mv ${AUX_DIR}/${ROOT_FILE}.pdf ${OUTPUT_DIR}/${PROJECT_NAME}.pdf

glossary:
	makeglossaries -d ${AUX_DIR} ${ROOT_FILE}

secure:
	make all
	# password encrypt the pdf
	pdftk ${AUX_DIR}/${PROJECT_NAME}.pdf \
	output ${AUX_DIR}/${PROJECT_NAME}.secured.pdf \
	owner_pw PROMPT \
	user_pw PROMPT
	make clean

.PHONY: clean

clean:
	rm ${AUX_DIR}/*
	rm ${OUTPUT_DIR}/*
