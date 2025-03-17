# 清理CV网站模板的PowerShell脚本

# 1. 删除原作者特定的部署脚本和重定向文件
Write-Host "Deleting author-specific deployment scripts and redirect files..."
Remove-Item -Path "__deploy.sh" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "__redirect_mit.html" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "__redirect_su.html" -Force -ErrorAction SilentlyContinue

# 2. 删除原作者的项目文件
Write-Host "Deleting author's project files..."
Get-ChildItem -Path "_projects/" -File | Remove-Item -Force -ErrorAction SilentlyContinue

# 3. 创建一个空的项目模板文件作为参考
# 注意: 如果您想保留目录结构但清空内容
if (!(Test-Path "_projects/example_project_template.md")) {
    @"
---
layout: project
title: Project Template
description: This is an example project template
---

# Project Title

## Description
Add your project description here.

## Technologies
- Tech 1
- Tech 2
- Tech 3

## Results
Describe your project results here.
"@ | Out-File -FilePath "_projects/example_project_template.md" -Encoding utf8
}

# 4. 清空原作者的数据文件，但保留结构
Write-Host "Clearing author's data files while preserving structure..."

# 清空 projects.yaml
@"
# Projects list
# Format reference:
# - name: Project name
#   description: Short project description
#   url: Project URL (if available)
#   image: assets/projects/project-image.jpg
#   year: Completion year
#   category: Project category (e.g. Web, Mobile, AI)
#   tech: Technologies used
"@ | Out-File -FilePath "_data/projects.yaml" -Encoding utf8

# 清空 experience.yaml
@"
# Work and education experience
# Format reference:
# Work experience:
# - place: Company/organization name
#   time: Work time period
#   title: Position title
#   description: Responsibility description
#   
# Education:
# - place: School name
#   time: Attendance period
#   title: Degree and major
#   description: Education description
"@ | Out-File -FilePath "_data/experience.yaml" -Encoding utf8

# 清空 publications.yaml
@"
# Publications and papers list
# Format reference:
# - title: Paper title
#   authors: Author list
#   venue: Published journal/conference
#   year: Publication year
#   url: Paper link (if available)
#   pdf: assets/publications/paper-pdf-filename.pdf (if available)
"@ | Out-File -FilePath "_data/publications.yaml" -Encoding utf8

# 修改 main_info.yaml
@"
# Basic personal information
name: Your Name
email: your.email@example.com
phone: 
address: 
github: https://github.com/yourusername
linkedin: https://www.linkedin.com/in/yourusername
twitter: 
description: This is a short self-introduction that will be displayed on the homepage
"@ | Out-File -FilePath "_data/main_info.yaml" -Encoding utf8

# 删除 template_users.yaml，这是模板特定的
Remove-Item -Path "_data/template_users.yaml" -Force -ErrorAction SilentlyContinue

# 5. 清理原作者的个人资源文件
Write-Host "Cleaning author's personal resource files..."

# 清空 publications 目录
Get-ChildItem -Path "assets/publications/" -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

# 清空 projects 目录
Get-ChildItem -Path "assets/projects/" -Recurse | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

# 清空 profile-pics 目录，但保留目录结构
Get-ChildItem -Path "assets/profile-pics/" -File | Remove-Item -Force -ErrorAction SilentlyContinue

# 清空 cv 目录，但保留目录结构
Get-ChildItem -Path "assets/cv/" -File | Remove-Item -Force -ErrorAction SilentlyContinue

# 6. 更新 index.html 的部分内容
Write-Host "Updating index.html basic content..."

# 创建目录备份
if (!(Test-Path -Path "backup")) {
    New-Item -Path "backup" -ItemType Directory
}

# 备份原始的 index.html
Copy-Item -Path "index.html" -Destination "backup/index.html" -Force

Write-Host "Cleanup complete! The template is ready for your content."
Write-Host "Original files have been backed up to the 'backup' directory."
Write-Host "You can now:
1. Add your personal information to YAML files in the _data/ directory
2. Add your projects to the _projects/ directory
3. Add your photos to the assets/profile-pics/ directory
4. Add your resume to the assets/cv/ directory
5. Modify index.html to suit your needs" 