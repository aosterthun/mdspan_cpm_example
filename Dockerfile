# Base on the latest available debian docker image
FROM debian:sid

# Bring installed packages up to the latest version
RUN apt-get update

# Install essential packages
RUN apt-get install -y lsb-release wget software-properties-common gnupg git locales fonts-powerline clang clangd g++ cmake ninja-build zsh python3 python3-pip python3-venv

RUN chsh -s /usr/bin/zsh

# Install oh my zsh
RUN sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install oh my zsh plugins and update configuration
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
RUN sed -i 's/plugins=(git)/plugins=(git virtualenv zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="jonathan"/' ~/.zshrc

SHELL ["/usr/bin/zsh", "-c"]

# Setup virtual environment
RUN python3 -m venv /opt/venv

# Install CMake format 
RUN . /opt/venv/bin/activate && pip3 install cmakelang

# Install ipykernel
RUN . /opt/venv/bin/activate && pip3 install ipykernel

# Install doxygen 
RUN apt-get install -y doxygen

# Install mkdocs and plugins
RUN . /opt/venv/bin/activate && pip3 install mkdocs==1.4.3 mkdocs-material==9.1.9 mkdoxy==1.0.6




