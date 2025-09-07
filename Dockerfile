# 使用与您n8n版本匹配的官方镜像
FROM n8nio/n8n:1.103.2

# 切换到root用户以获取安装权限
USER root

# 在构建镜像时，就安装好所有依赖
RUN apk add --no-cache python3 py3-pip ffmpeg && \
    pip install yt-dlp

# 切换回node用户以保证安全运行
USER node
