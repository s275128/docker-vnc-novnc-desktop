FROM qcfe/ubuntu-vnc-novnc-desktop

ARG PYCHARM_VERSION="2020.2.3"

# Install wget
RUN apt-get install wget -y

# Download and extract Pycharm
RUN mkdir -p /opt/pycharm && \
    wget -qO- https://download.jetbrains.com/python/pycharm-community-${PYCHARM_VERSION}.tar.gz | tar xz --strip 1 -C /opt/pycharm

# Clean up
RUN apt-get purge wget -y && apt-get --purge autoremove -y && apt-get autoclean -y

# Copy Pycharm configuration
COPY config $HOME/.config/

# Set permissions
RUN chown -R $USER:$USER $HOME

# Copy startup scripts and supervisor config
COPY base /opt/base/

# Default python project path (can be overridden with `--env PROJECT_DIR=/path/to/project/` in `docker run`)
ENV PROJECT_DIR=$HOME/PycharmProjects/pythonProject

CMD [ "/bin/bash", "/opt/base/startup.sh" ]