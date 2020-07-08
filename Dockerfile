FROM gcr.io/kaniko-project/executor:v0.24.0

COPY --from=gcr.io/kaniko-project/warmer:v0.24.0 /kaniko/warmer /kaniko
COPY --from=middagj/kaniko-base /busybox /busybox
COPY --from=middagj/kaniko-bash /busybox /busybox
COPY --from=middagj/kaniko-coreutils /busybox /busybox
COPY --from=middagj/kaniko-findutils /busybox /busybox
COPY --from=middagj/kaniko-git /busybox /busybox
COPY --from=middagj/kaniko-grep /busybox /busybox
COPY --from=middagj/kaniko-sed /busybox /busybox

ENV PATH="$PATH:/busybox/bin:/busybox"

SHELL ["/busybox/bin/bash", "-o", "pipefail", "-c"]
# GitLab runner expects sh at /busybox/sh
RUN ln /busybox/bin/bash /busybox/sh

ENTRYPOINT []
CMD ["/busybox/bin/bash"]

# Whitelist /busybox
VOLUME /busybox
