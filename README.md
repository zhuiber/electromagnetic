# electromagnetic
<!-- 初始化仓库 -->
git init

<!-- 克隆仓库 -->
git clone https://github.com/username/repository.git

<!-- 添加文件到暂存区 -->
git add example.txt

<!-- 提交更改 -->
git commit -m "Add example.txt"

<!-- 查看状态 -->
git status

<!-- 查看提交历史 -->
git log

<!-- 创建分支 -->
git branch feature

<!-- 切换分支 -->
git checkout feature

<!-- 合并分支 -->
git merge feature

<!-- 推送到远程仓库 -->
git push origin feature

<!-- 从远程仓库拉取更改 -->
git pull origin main

<!-- 删除分支 -->
git branch -d feature

<!-- 重置暂存区和工作区 -->
git reset HEAD example.txt




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


本地终端操作

### 示例
假设你的项目在 `C:\Users\ADMIN\Desktop\electromagnetic` 目录中，并且你已经配置好了远程仓库：

```sh
cd C:\Users\ADMIN\Desktop\electromagnetic
git remote -v    # 确认远程仓库
git branch       # 确认当前分支
git push origin main
```

### 解决错误的方法
1. **远程仓库配置错误**：
   如果 `git remote -v` 显示的远程仓库 URL 不正确，可以使用以下命令更新远程仓库 URL：

   ```sh
   git remote set-url origin https://github.com/yourusername/yourrepository.git
   ```

2. **权限问题**：
   确保你有推送到远程仓库的权限。如果使用 HTTPS URL，请确保你输入了正确的用户名和密码（或 GitHub 个人访问令牌）。如果使用 SSH URL，确保你的 SSH 密钥已添加到 GitHub。

3. **分支名称错误**：
   确保你推送到正确的分支。例如，如果你的主分支名称是 `main`，请使用 `git push origin main`。如果你的主分支名称是 `master`，请使用 `git push origin master`。












