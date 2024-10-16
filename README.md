# docker-build-secrets

This demo repository shows a good way to handle secrets with Docker at "build-time".

To run the docker-compose you can:

```bash

# The "--progress=plain" option ensures that you can check the output of the "echo" command in the console output.
# The "GITHUB_TOKEN" at the start of the command sets an environment variable only for that command. Only works for Unix. 

$ GITHUB_TOKEN=<add-some-dummy-value-here> docker compose build --no-cache --progress=plain api && docker compose up
```

You will see that in the middle of the build log there is a line like: "Printing 'add-some-dummy-value-here' at build time"
and in the run log you should see something like:

"Printing '' should be empty but 'example runtime env var' isn't".

The cool thing about this is that the GITHUB_TOKEN environment variable is only available in the RUN command that mounts it,
avoiding leaks.

This method is preferred over ARG or ENV as these methods can leak the secret values. 

**Notes**:
- For some reason, the Github Action option `secrets` doesn't seem to work when setting an "env variable"
as a secret value (f.e: ${{ env.GITHUB_ACTOR }}). It works fine when hard-coding the value though.