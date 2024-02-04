# ベースイメージ
FROM ubuntu:latest

# 環境変数
ENV DEBIAN_FRONTEND=noninteractive

# パッケージのインストール
# apt-get update、インストール、掃除を一連のコマンドとして実行
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git curl python3 python3-pip python3-dev golang \
    && apt-get clean \

    # 新しいユーザーを追加 (推奨: UID 1000 で一般的なユーザーIDを使用)
    && useradd -m -s /bin/bash -u 1000 dev

# ユーザー dev の作業ディレクトリを設定
WORKDIR /home/dev

# ユーザーフォルダーの所有権をdevに設定
RUN chown -R dev:dev /home/dev

# ユーザーを切り替え
USER dev

# コンテナが起動した時に実行されるコマンド (ここではbashを保持)
CMD ["/bin/bash"]
