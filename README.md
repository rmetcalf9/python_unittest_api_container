

# Steps to release a new version


git tag -l
git tag NEW_VER
git add --all
git commit -m"Releasing NEW_VER"
git push
git push --tags

Docker hub should pick up new version and build an image
