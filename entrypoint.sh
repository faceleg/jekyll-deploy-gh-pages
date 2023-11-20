#!/bin/sh

set -e

echo '👍 ENTRYPOINT HAS STARTED—INSTALLING THE GEM BUNDLE'
bundle install
bundle list | grep "jekyll ("
echo '👍 BUNDLE INSTALLED—BUILDING THE SITE'
bundle exec jekyll build
echo '👍 THE SITE IS BUILT—PUSHING IT BACK TO GITHUB-PAGES'

echo "ls -lha"
ls -lha
cd build

echo "pwd"
pwd

echo "ls -lha"
ls -lha

remote_repo="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" &&
	remote_branch="gh-pages" &&
	git config --global init.defaultBranch main &&
	git init &&
	git config user.name "${GITHUB_ACTOR}" &&
	git config user.email "${GITHUB_ACTOR}@users.noreply.github.com" &&
	git add . &&
	echo -n 'Files to Commit:' && ls -l | wc -l &&
	git commit -m 'action build' >/dev/null 2>&1 &&
	# git push --force $remote_repo main:$remote_branch >/dev/null 2>&1 &&
	git push --force $remote_repo main:$remote_branch >/dev/null
rm -fr .git &&
	cd ../

echo "	git push --force $remote_repo $remote_branch >/dev/null 2>&1 &&"

echo '👍 GREAT SUCCESS!'
