# EUF Barrio SASS starterkit

This is a clone of the Barrio SASS starterkit subtheme for Bootstrap Barrio.

Bootstrap Barrio is a Drupal 8 theme built on Bootstrap 4 with a Gulp based build system.

The EUF starterkit includes sensible defaults for the theme settings, some Twig templates for common use cases, some tweaks to the build system and EUF branding. This starterkit is meant to be cloned into a new theme for each particular project but can also be used as-is for EUF related projects.

## Stack information

Cloned from Bootstrap 4 - Barrio SASS Starter Kit:

  - https://www.drupal.org/project/bootstrap_sass
  - https://www.drupal.org/docs/8/themes/bootstrap-4-sass-barrio-starter-kit

Depends on Barrio:

  - https://www.drupal.org/project/bootstrap_barrio
  - https://www.drupal.org/docs/8/themes/barrio-bootstrap-4-drupal-89-theme

## Installation

The EUF base theme should be placed in the `web/themes/contrib` folder, either manually or via **composer** (coming soon...). Although it works by itself, it is designed to be copied into a local custom theme where front-end development will occur.

To create a custom theme, go to `web/themes/contrib/euf_bootstrap_sass` and run the interactive script:

    . scripts/create-subtheme.sh

When developing the custom theme with the standard EUF Docker stack, enable the NodeJS container in `docker-composer.yml` and define the relevant variables in the `.env` file.

    make stop                 # if the containers are running
    nano docker-compose.yml   # uncomment the relevant lines
    nano .env                 # define the custom theme directory
    make up                   # start the containers again
    make node-shell           # to access the shell of the NodeJS container
    gulp                      # to run the build tools

When developing on a standard LAMP stack, it is necessary to declare an environment variable for the build tools to work properly, for example:

    export PROJECT_BASE_URL=http://localhost

## Build tools

This theme includes Gulp as the task runner, SASS compilation, Autoprefixer and BrowserSync, among other tools. Check the `gulpfile.js` for more details.

## Branding

The base theme includes a few EUF branding elements, such as the "screenshot", the favicon and two versions of the EUF logo for the navbar: one in color, another in white for high contrast / dark navbar color schemes. Comment or uncomment the respective lines in the `THEME.info.yml` file to switch between them.
