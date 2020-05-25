#!/bin/bash
# Script to quickly create sub-theme.

echo '
+----------------------------------------------------------------------------+
| With this script you could quickly create euf_bootstrap_sass sub-theme     |
| In order to use this:                                                      |
| - euf_bootstrap_sass theme (this folder) should be in the contrib folder   |
+----------------------------------------------------------------------------+
'
echo 'The machine name of your custom theme? [e.g. mycustom_bootstrap_sass]'
read CUSTOM_BOOTSTRAP_SASS

echo 'Your theme name ? [e.g. My custom bootstrap_sass]'
read CUSTOM_BOOTSTRAP_SASS_NAME

if [[ ! -e ../../custom ]]; then
    mkdir ../../custom
fi
cd ../../custom
cp -r ../contrib/euf_bootstrap_sass $CUSTOM_BOOTSTRAP_SASS
cd $CUSTOM_BOOTSTRAP_SASS
for file in *euf_bootstrap_sass.*; do mv $file ${file//euf_bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS}; done
for file in config/*/*euf_bootstrap_sass.*; do mv $file ${file//euf_bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS}; done

# Remove create_subtheme.sh file, we do not need it in customized subtheme.
rm scripts/create_subtheme.sh

# mv {_,}$CUSTOM_BOOTSTRAP_SASS.theme
grep -rl euf_bootstrap_sass .|xargs sed -i -e "s/euf_bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS/"
sed -i -e "s/EUF Bootstrap SASS/$CUSTOM_BOOTSTRAP_SASS_NAME/" $CUSTOM_BOOTSTRAP_SASS.info.yml
echo "# Check the themes/custom folder for your new sub-theme."
