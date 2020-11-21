FROM qcfe/ubuntu-vnc-novnc-desktop

ARG PYCHARM_VERSION="2020.2.3"

# Download Pycharm
ADD ["https://download.jetbrains.com/python/pycharm-community-${PYCHARM_VERSION}.tar.gz", "/tmp/pycharm.tar.gz"]

# Extract Pycharm
RUN tar xvzf /tmp/pycharm.tar.gz -C /opt/ && rm /tmp/pycharm.tar.gz

# Rename dir
RUN mv "/opt/pycharm-community-${PYCHARM_VERSION}" /opt/pycharm

# Copy Pycharm configuration
COPY config $HOME/.config/

# Set permissions
RUN chown -R $USER:$USER $HOME

# Copy startup scripts and supervisor config
COPY base /opt/base/

# Default python project path (can be overridden with `--env PROJECT_DIR=/path/to/project/` in `docker run`)
ENV PROJECT_DIR=$HOME/PycharmProjects/pythonProject

CMD [ "/opt/base/startup.sh" ]