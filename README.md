# kaniko

Kaniko image with normal bash, coreutils, dash, findutils, grep, git, jq, less, make, nextvi, sed, yq and zsh.

## Addition
The additional files are placed in `/busybox`.
However, it is not busybox at all!
The busybox is whitelisted by setting it as a volume.
This is the same technique as used by the
[debug variant of kaniko](https://github.com/GoogleContainerTools/kaniko/blob/main/deploy/Dockerfile).
The `sh` is put as `/busybox/sh` such that the GitLab Runner picks it up.

## License
This software is licensed under the MIT License. [View the license](LICENSE).
