FROM r-base:4.1.3

RUN apt-get update && \
    apt-get install -y libxml2-dev libssl-dev unixodbc unixodbc-dev odbc-postgresql libcurl4-openssl-dev && \
    rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('ggridges', 'ggplot2', 'viridis', 'hrbrthemes', 'RPostgres', 'aws.s3'), dependencies=TRUE, repos='https://cran.rstudio.com/')"

CMD ["Rscript", "main.R"]
