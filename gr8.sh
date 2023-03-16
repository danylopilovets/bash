#!/bin/bash

set -e

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --filename)
      filename="$2"
      shift
      shift
      ;;
    *)
      shift
      ;;
  esac
done

if [[ "$filename" != *.csv ]]; then
  echo "Error: filename must end with .csv"
  exit 1
fi

while IFS=, read -r username groups; do
  username=$(echo "$username" | tr ',' '_')
  if ! id -u "$username" >/dev/null 2>&1; then
    password=$(openssl rand -base64 12)
    useradd -m -p "$(openssl passwd -1 "$password")" "$username"
    echo "User $username created with password: $password"
  fi

  for group in $(echo "$groups" | tr ',' ' '); do
    group=$(echo "$group" | sed 's/[^a-zA-Z0-9_-]//g')
    if [ -n "$group" ] && ! getent group "$group" >/dev/null 2>&1; then
      groupadd "$group"
      echo "Group $group created"
    fi
    if [ -n "$group" ]; then
      usermod -a -G "$group" "$username"
    fi
  done
done < "$filename"

