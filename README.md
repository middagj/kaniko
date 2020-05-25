# kaniko

Kaniko image with normal bash, coreutils, findutils, grep and git.

## Addition
The additional files are placed in `/busybox` so the GitLab runner picks them up.
However, it is not busybox at all!
The busybox is whitelisted by setting it as a volume.
This is the same technique as used by the
[debug variant of kaniko](https://github.com/GoogleContainerTools/kaniko/blob/master/deploy/Dockerfile_debug).

## License
This software is licensed under the MIT License. [View the license](LICENSE).
