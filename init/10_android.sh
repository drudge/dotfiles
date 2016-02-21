# Android-only stuff. Abort if not Android.
[[ "$(uname -o 2> /dev/null)" =~ Android ]] || return 1

if [[ "$(type -P apt)" ]]; then
  e_header "Updating APT"
  apt update

  # Install APT packages.
  packages=(
    git
    openssh
    nodejs
    curl
    vim
    zsh
    nmap
  )

  list=()
  for package in "${packages[@]}"; do
    if [[ ! "$(dpkg -l "$package" 2>/dev/null | grep "^ii  $package")" ]]; then
      list=("${list[@]}" "$package")
    fi
  done

  if (( ${#list[@]} > 0 )); then
    e_header "Installing APT packages: ${list[*]}"
    for package in "${list[@]}"; do
      apt install "$package"
    done
  fi
fi