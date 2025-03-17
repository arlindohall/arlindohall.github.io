#!/bin/bash

REPO_DIRECTORY=$(pwd)
EVENTS_DIRECTORY="/tmp/event-log"
EVENTS_REPOSITORY="https://github.com/arlindohall/event-log.git"

TARGET_DIRECTORY="$REPO_DIRECTORY/events/"
EVENTS_FILE="$REPO_DIRECTORY/EVENTS_VERSION"
LATEST_COMMIT_FILE="/tmp/EVENTS_VERSION"

function clone_events() {
  echo "Cloning events repository"
  cd "/tmp"
  rm -rf "$EVENTS_DIRECTORY"
  git clone "$EVENTS_REPOSITORY"
}

function update_commit_hash() {
  echo "Updating latest commit hash"
  cd "$EVENTS_DIRECTORY"
  git log --format="%H" | head -1 >"$LATEST_COMMIT_FILE"
}

function events_has_been_updated() {
  echo "Checking for updates to events repo"
  if diff "$EVENTS_FILE" "$LATEST_COMMIT_FILE"; then
    # No difference
    return 1
  else
    return 0
  fi
}

function install_npm() {
  # Do this here instead of up a level so we exit early if we don't need it
  if which pnpm; then
    return
  fi
  sudo apt update && sudo apt install -y nodejs npm
}

function build_latest_artifacts() {
  echo "Building events repo"
  cd "$EVENTS_DIRECTORY"
  install_npm
  pnpm install
  pnpm run build
}

function copy_latest_artifacts() {
  echo "Copying artifacts"
  cd "$EVENTS_DIRECTORY"
  rsync -r build/ "$TARGET_DIRECTORY"
}

function copy_version_file() {
  echo "Copying version file"
  cp "$LATEST_COMMIT_FILE" "$EVENTS_FILE"
}

function build_events() {
  clone_events
  update_commit_hash
  if events_has_been_updated; then
    build_latest_artifacts
    copy_latest_artifacts
    copy_version_file
  fi
}

build_events
