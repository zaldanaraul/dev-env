FROM ubuntu:jammy-20230126


ARG USERNAME=testuser
ARG PASSWORD=password
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install apt
RUN apt-get update && apt-get install sudo openssl

# Create user USERNAME
RUN groupadd --gid $USER_GID $USERNAME
RUN useradd --uid "$USER_UID" --create-home --home-dir "/home/$USERNAME" --shell "/bin/bash" --gid "$USER_GID" --groups sudo "$USERNAME" --password "$(openssl passwd -1 $PASSWORD)"
        
USER $USERNAME

