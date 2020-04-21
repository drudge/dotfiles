#############################################
### 
###  $ brew tap homebrew/bundle
###  $ brew bundle
### 
#############################################

#############################################
### store apps in the Applications folder
#############################################

cask_args appdir: "/Applications"

#############################################
### use casks to install apps
#############################################

tap 'homebrew/cask'

#############################################
### install oracle java
#############################################

cask 'oracle-jdk' unless system '/usr/libexec/java_home --failfast'

### or openjdk

# cask 'java' unless system '/usr/libexec/java_home --failfast'

#############################################
### install essential apps
#############################################

#cask 'tunnelblick'
cask 'slack'
cask 'google-chrome'
cask 'chromedriver'
cask 'docker'
cask 'shimo'
# cask '1password-cli'
cask 'alfred'

#############################################
### and editors
#############################################

cask 'visual-studio-code'
#cask 'intellij-idea-ce'

#############################################
### utilities
#############################################

cask 'the-unarchiver'
cask 'tableplus'
#cask 'squirrelsql'
cask 'fork'
#cask 'tower'
#cask 'cyberduck'
cask 'mongodb-compass'
cask 'paw'
cask 'transmit'
cask 'mailplane'
cask 'kaleidoscope'
# cask 'sketch'
# studio-3t

#############################################
### cli essentials
#############################################

brew 'nvm'
brew 'gauge' 
brew 'git'
brew 'git-extras'
brew 'rsync'
brew 'libxml2'
brew 'openssl'
brew 'python3'
brew 'nmap'
brew 'curl'
brew 'jq'
brew 'awscli'
brew 's3cmd'
brew 'maven'
brew 'pv'
brew 'mosh'

#############################################
### configure services
#############################################

# brew 'postgresql'
# brew 'mysql'
# brew 'redis'
# brew 'mongodb'

#############################################
### from the mac app store
#############################################

mas 'Microsoft Remote Desktop 10', id: 1295203466
mas 'Things 3', id: 904280696
mas 'Pixelmator', id: 407963104
mas 'BrowserFreedom', id: 1081203896 
mas 'Deliveries', id: 924726344
mas 'Xcode', id: 497799835
mas 'The Unarchiver', id: 425424353
mas 'Jump Desktop', id: 524141863