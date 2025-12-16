FROM continuumio/miniconda3:25.3.1-1

RUN conda config --remove channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    conda config --set channel_priority strict && \
    conda install -n base -c conda-forge mamba -y && \
    conda clean -afy

COPY . /CADD-SV

RUN mamba env update -n base --file /CADD-SV/environment.yaml && \
    mamba clean -afy

RUN mamba env create -n SV --file /CADD-SV/envs/SV.yml && \
    mamba clean -afy
