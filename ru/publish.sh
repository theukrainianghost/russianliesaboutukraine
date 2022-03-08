#!/bin/bash
rm -rf _config.yml
cp _config.yml.github _config.yml
JEKYLL_ENV=production jekyll build
git add .
now=$(date)
git commit -m "$now"
git push
cd _site
rm -rf publish.sh
touch .nojekyll
git add .
now=$(date)
git commit -m "$now"
git push --force --set-upstream origin gh-pages
cd ..
rm -rf _config.yml
cp _config.yml.docker _config.yml
JEKYLL_ENV=production jekyll build
sshpass -p "ukraine69@" ssh ukraine@192.168.0.189 "rm -rf /disk/save/containers/ukr/*"
sshpass -p "ukraine69@" scp -r _site/* ukraine@192.168.0.189:/disk/save/containers/ukr
sshpass -p "ukraine69@" ssh ukraine@192.168.0.189 "rm /disk/save/containers/ukr/publish.sh"