FROM mlabproject/kicad_auto:nightly
LABEL MAINTAINER nerdyscout <nerdyscout@posteo.de>
LABEL MAINTAINER Roman Dvořák <romandvorak@mlab.cz>
LABEL Description="export various files from KiCad projects"
LABEL VERSION="v2.2"

RUN apt-get update 
RUN apt-get install -y --no-install-recommends git
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY submodules/kicad-git-filters/kicad-git-filters.py /opt/git-filters/

COPY config/*.kibot.yaml /opt/kibot/config/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
