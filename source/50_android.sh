
if [[ "$OSTYPE" =~ "^darwin" ]]; then
  JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home"
  STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk
  IDEA_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk

  if [ -e "/Applications/Android Studio.app/sdk" ]; then
    ANDROID_HOME="/Applications/Android Studio.app/sdk"
  else
    ANDROID_HOME="$HOME/Library/Android/sdk"
  fi

  export BUILD_MAC_SDK_EXPERIMENTAL=1
else
  ANDROID_HOME="/opt/android-studio/sdk"
fi

export STUDIO_JDK
export JAVA_HOME
export ANDROID_HOME

PATH=$ANDROID_HOME/tools:$(path_remove $ANDROID_HOME/tools)
PATH=$ANDROID_HOME/platform-tools:$(path_remove $ANDROID_HOME/platform-tools)

if [[ "$(uname -o 2> /dev/null)" =~ "Android" ]]; then
  alias update="apt update"
  alias install="apt install"
  alias remove="apt remove"
  alias search="apt-cache search"
fi