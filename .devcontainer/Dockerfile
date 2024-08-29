FROM alpine:3.19

# add a non-root user
ARG USER_NAME=latex-workspace
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN addgroup --gid $USER_GID -S $USER_NAME && \
  adduser -G $USER_NAME --shell /bin/sh --disabled-password --home /home/$USER_NAME --uid $USER_UID $USER_NAME

RUN apk update && apk add --no-cache \
  git \
  texlive \
  texlive-xetex \

# always run the container as the non-root user
USER $USER_NAME

