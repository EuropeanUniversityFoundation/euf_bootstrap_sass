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

The EUF base theme should be placed in the `web/themes/contrib` folder, either manually or via **composer**. If you're using the `euf-base` installation profile, the package is already included. Otherwise, include the repository in your project's `composer.json` file:

    "repositories": [
        ...
        {
            "type": "vcs",
            "url": "https://github.com/EuropeanUniversityFoundation/euf_bootstrap_sass"
        }
    ],

Then you can require the package as usual:

    composer require euf/euf_bootstrap_sass

Finally, install the theme:

    drush then euf_bootstrap_sass

Although this theme works by itself, it is designed to be copied into a local custom theme where front-end development will occur. To create a custom theme, go to `web/themes/contrib/euf_bootstrap_sass` and run the interactive script:

    bash scripts/create-subtheme.sh

When developing the custom theme with the standard EUF Docker stack, enable the NodeJS container using `docker-composer.override.yml`:

    make stop                           # if the containers are running
    cp node.docker-compose.override.yml docker-compose.override.yml
    nano docker-compose.override.yml    # change the custom theme path
    make up                             # start the containers again
    make node-shell                     # to access the shell of the NodeJS container
    gulp -v                             # to confirm both gulp and gulp-cli are installed
    gulp                                # to run the build tools

## Build tools

This theme includes **Gulp** as the task runner, **SASS** compilation, **Autoprefixer** and **BrowserSync** (currently disabled), among other tools. Check the `gulpfile.js` for more details.

### BrowserSync on LAMP

In order to use BrowserSync when developing on a standard LAMP stack, it is necessary to uncomment the relevant parts of the `gulpfile` and then manually declare an environment variable, for example:

    export BROWSERSYNC_PROXY=http://localhost

### BrowserSync on Docker

**CURRENTLY NOT SUPPORTED.**

## Branding

The base theme includes a few EUF branding elements, such as the "screenshot", the favicon and two versions of the EUF logo for the navbar: one in color, another in white for high contrast / dark navbar color schemes. Comment or uncomment the respective lines in the `THEME.info.yml` file to switch between them. Don't forget to `drush cr` for the changes to take effect.
