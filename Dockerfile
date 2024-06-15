FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    xzdec \
    perl \
    make \
    fontconfig \
    && apt-get clean

# Install TeX Live
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xzf install-tl-unx.tar.gz \
    && cd install-tl-* \
    && printf '%s\n' \
       "selected_scheme scheme-basic" \
       "TEXDIR /usr/local/texlive" \
       "TEXMFLOCAL /usr/local/texlive/texmf-local" \
       "TEXMFSYSVAR /usr/local/texlive/texmf-var" \
       "TEXMFSYSCONFIG /usr/local/texlive/texmf-config" \
       "TEXMFVAR ~/.texlive/texmf-var" \
       "TEXMFCONFIG ~/.texlive/texmf-config" \
       "binary_x86_64-linux 1" > texlive.profile \
    && ./install-tl --profile=texlive.profile \
    && cd .. \
    && rm -rf install-tl-unx.tar.gz install-tl-*

# Update PATH
ENV PATH="/usr/local/texlive/bin/x86_64-linux:${PATH}"

# Install essential collections
RUN tlmgr install \
    collection-basic \
    collection-latex \
    collection-latexrecommended \
    collection-xetex

# Install remaining packages individually for debugging
RUN tlmgr install fontawesome5
RUN tlmgr install xcolor
RUN tlmgr install url
RUN tlmgr install parskip
RUN tlmgr install geometry
RUN tlmgr install enumitem
RUN tlmgr install supertabular
RUN tlmgr install titlesec

# Install additional LaTeX packages
RUN tlmgr update --self && \
    tlmgr install multirow


# Manually run fmtutil to generate formats
RUN fmtutil-sys --all

WORKDIR /data

ENTRYPOINT ["sh", "-c", "xelatex -output-directory=out data/resume.tex"]
