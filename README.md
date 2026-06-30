#### Windows Acer Configuration

$Env:XDG_CONFIG_HOME = C:\Users\morty\.config\

Local:
```ps1
c $Env:CONFIG_HOME
git init
echo ".git/" >> .gitignore
git status
git add --all --verbose
git commit --message "$(date)"
```

Remote:
```ps1
gh auth status
gh auth login
gh repo create acer_win_config --public --source=. --remote=origin
git push --set-upstream origin main
git remote --verbose
```
