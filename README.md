# Personal CV Website Template

This is a clean, elegant and customizable Jekyll-based personal CV/resume website template.

## Quick Start

### Local Preview
To preview your website locally, first install Jekyll:

1. Install [Ruby](https://rubyinstaller.org/downloads/) (Windows) or via package manager (Mac/Linux)
2. Install Jekyll and Bundler:
```
gem install jekyll bundler
```
3. Clone this repository:
```
git clone https://github.com/yourusername/yourusername.github.io.git
cd yourusername.github.io
```
4. Start the local preview server:
```
jekyll serve
```
5. Visit http://localhost:4000 in your browser to view your website

### Customizing Content

Modify files in the `_data` directory to update your personal information:

- `main_info.yaml`: Basic personal information and social media links
- `experience.yaml`: Work and education history
- `projects.yaml`: Project experience
- `publications.yaml`: Publications and papers (if applicable)

### Adding Projects

Create Markdown files in the `_projects` directory to add project showcase pages. Refer to the example template file `example_project_template.md`.

### Adding Resources

- Add your photos to the `assets/profile-pics/` directory
- Add your resume PDF to the `assets/cv/` directory
- Add project images to the `assets/projects/` directory

## Deploying to GitHub Pages

1. Push the repository to GitHub:
```
git add .
git commit -m "Initialize personal website"
git push
```

2. Enable GitHub Pages in your GitHub repository settings

3. After a few minutes, your website will be accessible at `https://yourusername.github.io`

## Template Structure

- `_data/`: YAML files containing personal data
- `_includes/`: Reusable HTML components
- `_layouts/`: Page layout templates
- `_projects/`: Markdown files for project pages
- `assets/`: Images, resume and other resources
- `libs/`: External libraries and dependencies
- `index.html`: Home page

## External Libraries Used

- Framework: [Jekyll](http://jekyllrb.com/)
- CSS:
  - [Skeleton](https://getskeleton.com)
  - Tabs: [Skeleton Tabs](https://github.com/nathancahill/skeleton-tabs)
  - Timeline: [Timeline](https://codepen.io/NilsWe/pen/FemfK)
  - Icons: [Font Awesome](http://fontawesome.io/)
- JS:
  - [jQuery (3.1.1)](https://jquery.com/)

## Customization
To change the look and feel of the website, modify the templates in the `_layouts` directory and CSS files in the `libs` directory.
