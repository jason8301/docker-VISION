FROM bioconductor/release_core2

WORKDIR /data/

RUN apt-get update -y && \
    apt-get install -y build-essential && \
    Rscript --no-save --no-restore --slave -e \
    'install.packages("devtools");library("devtools");install_github("YosefLab/VISION",ref = "staging")'

CMD Rscript -e 'library(VISION); viewResults(readRDS("/data/vision.rds"), browser=F, port=8080)'
