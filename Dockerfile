FROM r-base:4.1.3

RUN apt-get update && apt-get install -y libxml2-dev && rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('ggridges', 'ggplot2', 'viridis', 'hrbrthemes'), dependencies=TRUE, repos='https://cran.rstudio.com/')"

CMD ["Rscript", "main.R"]
