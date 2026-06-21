#### Windows C:\Users\morty\.config\

Local:
```ps1
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
