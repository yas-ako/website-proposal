#!/bin/bash
set -e

# mkdir -p ./outputs/pdf
# mkdir -p ./outputs/html
mkdir -p ./outputs/ebub


CURRENT_PATH=`pwd`
ASCIIDOCTOR_PDF_DIR=`gem contents asciidoctor-pdf --show-install-dir`


# asciidoctor command arguments
# -a, --attribute = ATTRIBUTE
# -B, --base-dir = DIR
# -D, --destination-dir = DIR
# -o, --out-file = OUT_FILE
# -R, --source-dir = DIR
# -b, --backend = BACKEND
# -d, --doctype = DOCTYPE
# -r, --require = LIBRARY

set -x

asciidoctor -a stylesheet=style/style.css -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/ -o index.html  -a imagesdir=${CURRENT_PATH}/images -r asciidoctor-diagram index.adoc

# asciidoctor-pdf -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/pdf/ -o output.pdf -a imagesdir=${CURRENT_PATH}/images -r asciidoctor-diagram -r ${CURRENT_PATH}/configs/config.rb -a scripts@=cjk -a pdf-styledir=${ASCIIDOCTOR_PDF_DIR}/data/theme -a pdf-style=${CURRENT_PATH}/theme/book.yml -a pdf-fontsdir=${CURRENT_PATH}/fonts -a allow-uri-read index.adoc

# asciidoctor-epub3 -B ${CURRENT_PATH}/ -D ${CURRENT_PATH}/outputs/ebub/ -o sample.epub -a imagesdir=${CURRENT_PATH}/images -r asciidoctor-diagram index.adoc