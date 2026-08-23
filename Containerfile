FROM archlinux:latest

ARG USERNAME=dotfiles
ARG USER_UID=1000
ARG USER_GID=1000

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PNPM_HOME=/home/${USERNAME}/.local/share/pnpm \
    PATH=/home/${USERNAME}/.local/share/pnpm/bin:/home/${USERNAME}/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

RUN pacman -Syu --noconfirm --needed \
        base-devel \
        curl \
        git \
        make \
        rustup \
        sudo \
    && pacman -Scc --noconfirm

RUN groupadd --gid "${USER_GID}" "${USERNAME}" \
    && useradd --uid "${USER_UID}" --gid "${USER_GID}" --create-home --shell /usr/bin/bash "${USERNAME}" \
    && printf '%s ALL=(ALL) NOPASSWD: ALL\n' "${USERNAME}" > /etc/sudoers.d/"${USERNAME}" \
    && chmod 0440 /etc/sudoers.d/"${USERNAME}"

WORKDIR /workspace
COPY --chown=${USERNAME}:${USERNAME} . /workspace
USER ${USERNAME}

RUN git config --global --add safe.directory /workspace \
    && make -C home/.scripts/installation all \
    && pre-commit run --all-files

CMD ["bash"]
