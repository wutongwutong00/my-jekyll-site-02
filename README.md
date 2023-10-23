# jekyll-docker-site

Base template for a Jekyll site using Docker

## Installation

Install:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Visual Studio Code extensions
  - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Build

- select the "Use this template" button at the top of this repo (you must be signed in to GitHub)
- select your site settings and then `git clone` the new repo to your computer
- show hidden files on your system (`Cmd + .` on Mac) and manually move the `.git` folder out from the repo (temporarily) for install
> NOTE: Changing permissions on git files leads to a misleading error that makes it seem like the build did not complete when it actually is fine.
- open repo in Visual Studio Code
> NOTE: if VS Code asks you about "opening the git file in the parent folder", ignore it
- start the Docker Desktop app
- open the command palette (`Cmd + Shift + P` on Mac) and select `"Open folder in container"`
- make sure the resulting window is the root folder of the repo, then accept
- select `"From Dockerfile"`, and then select `"Ok"` on the next prompt
- after the container builds, open an integrated terminal within the VS Code window
- run `sh setup.sh` in the terminal
- delete `setup.sh` file
- move the `.git` folder back into the repo

## After installation

1. Modify the baseurl and url in your _config.yml file
   the baseurl is `/your-root-folder`
   the url is `https://YourGitHubUserName.github.io`
1. Run Jekyll for the first time on your computer: `bundle exec jekyll serve --livereload`
1. Commit all your changes to Git locally
1. Publish your site to a new GitHub repo
1. In GitHub, enable GitHub Pages in the repo settings and test https://YourGitHubUserName.github.io/your-root-folder
1. Continue developing locally and pushing changes to GitHub

## Overriding the default theme

We likely do not want to use the default theme that Jekyll comes with (a gem-based theme called Minima). Most themes are Gem-based, which means you will not see the code in your repo. If a developer changes their theme and you type "bundle install", the theme will automatically update. You may not want that. If you want to modify the theme in any way, it is a good idea to completely override it by copying the files installed elsewhere in your Docker container and putting them into your repo. Here's how to reset the theme:

- open the integrated terminal and run `bundle info --path minima`
- copy the path it spits out, e.g. `/usr/local/src/rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/minima-2.5.1`
- go back to the terminal and run `cp /usr/local/src/rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/minima-2.5.1/. . -r -p`
> NOTE: this will copy and paste the files from the minima theme into your repo so you can see/edit them. Be careful about the syntax here. Notice the `/.` at the end of the filepath you copied.
- now you will see more folders and files that the theme was previously hiding from you
- edit these files accordingly, and remove the theme from `config.yml` and run `bundle remove minima` in the terminal
- remove all references to minima throughout the code

## Credit

Based on this excellent tutorial from Bill Raymond:

- [written format](https://gist.github.com/BillRaymond/db761d6b53dc4a237b095819d33c7332)
- [video format](https://youtu.be/zijOXpZzdvs?si=vPjOt-WGS59pu41w)
