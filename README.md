# electromagnetic

!git --version

!git add .

!git commit -m 'Your commit message'

!git push origin main


生成 SSH 密钥（如果还没有生成）：
!ssh-keygen -t rsa -b 4096 -C "your.email@example.com"

生成的 SSH 密钥通常位于 ~/.ssh 目录下。

将公钥添加到 GitHub：
打开 ~/.ssh/id_rsa.pub 文件，复制其中的内容。
登录到 GitHub，进入 Settings -> SSH and GPG keys，点击 New SSH key，将公钥粘贴进去并保存。


输入以下命令以查看现有的 SSH 公钥：
cat ~/.ssh/id_rsa.pub

如果你使用的是不同名称的密钥文件（例如 id_ed25519.pub），请相应地更改命令：
cat ~/.ssh/id_ed25519.pub












