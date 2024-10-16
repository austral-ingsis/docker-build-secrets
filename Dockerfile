# syntax=docker/dockerfile:1

FROM alpine:3.13.5
WORKDIR /app
# This is only for demo purposes, please don't print secrets in production!
# You can only use mounted secrets in the same "RUN" instruction that mounts them.
RUN --mount=type=secret,id=github_token,env=GITHUB_TOKEN,required \
    echo "Printing '$GITHUB_TOKEN' at build time"
ENTRYPOINT ["sh", "-c","echo \"Printing '$GITHUB_TOKEN' should be empty but '$EXAMPLE_RUNTIME_ENV_VAR' isn't\""]
