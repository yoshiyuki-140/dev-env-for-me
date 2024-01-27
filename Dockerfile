FROM ubuntu:latest

RUN apt update && apt upgrade -y\
    && apt install -y --no-install-recommends \
    curl \
    git \
    wget \
    gdebi\
    vim \
    # python環境install
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-wheel \
    python3-dev \
    python3-venv \
    # go 開発環境
    golang-go \
    # zsh install
    zsh \
    # oh my zsh install 
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    # vscode install
    && wget -O vscode-amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868 \
    && yes | gdebi vscode-amd64.deb \
    && rm vscode-amd64.deb \
    && rm -rf /var/lib/apt/lists/*

# 使用するベースイメージ

# 新しいユーザーを作成（rootでのログインを防ぐため）
RUN useradd -ms /bin/zsh kuro
USER kuro
WORKDIR /home/kuro

# シェルをzshに変更
SHELL ["/bin/zsh", "-c"]
