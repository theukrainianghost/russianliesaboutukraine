#!/bin/bash
rm -rf _config.yml
cp _config.yml.github _config.yml
JEKYLL_ENV=production jekyll build
touch ./_site/.nojekyll
git add .
now=$(date)
git commit -m "$now"
git push
rm -rf _config.yml
cp _config.yml.docker _config.yml
JEKYLL_ENV=production jekyll build
sshpass -p "ukraine69@" ssh ukraine@192.168.0.189 "rm -rf /disk/save/containers/ukr/*"
sshpass -p "ukraine69@" scp -r _site/* ukraine@192.168.0.189:/disk/save/containers/ukr
sshpass -p "ukraine69@" ssh ukraine@192.168.0.189 "rm /disk/save/containers/ukr/publish.sh"git remote add origin 