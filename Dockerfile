FROM r-base:4.3.3

WORKDIR /usr/app

RUN apt-get update && \
    apt-get install -y pkg-config libxml2-dev libssl-dev libcurl4-openssl-dev libfontconfig1-dev libcairo2-dev \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p $HOME/local/R_libs

ADD DESCRIPTION DESCRIPTION

RUN R -e "install.packages('renv', lib='~/local/R_libs')"
RUN R -e "library('renv', lib='~/local/R_libs'); renv::install();"

RUN useradd \
    --uid 1001 \
    --shell /bin/false \
    launcher

RUN chown -R launcher:launcher /usr/app
RUN chmod -R o+w /usr/app

USER 1001

CMD ["Rscript", "main.R"]
