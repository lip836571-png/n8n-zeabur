# 使用与您n8n版本完全匹配的官方镜像
FROM n8nio/n8n:1.103.2

# 切换到root用户以获取安装权限
USER root

# 健壮的安装命令：更新源、安装依赖、清理缓存
# 我们将python3-dev也加入，以防pip安装时需要编译
RUN apk update && \
    apk add --no-cache python3 python3-dev py3-pip ffmpeg && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir yt-dlp && \
    rm -rf /var/cache/apk/*

# 切换回node用户以保证安全运行
USER node
