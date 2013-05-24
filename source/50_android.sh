
if [[ "$OSTYPE" =~ "^darwin" ]]; then
  JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
  
  if [ -e "/Applications/Android Studio.app/sdk" ]; then
    ANDROID_HOME="/Applications/Android Studio.app/sdk"
  else
    ANDROID_HOME="$HOME/Development/adt-bundle-mac-x86_64/sdk"
  fi
  
  export BUILD_MAC_SDK_EXPERIMENTAL=1
else
  ANDROID_HOME="/opt/android-studio/sdk"
fi

export JAVA_HOME
export ANDROID_HOME

PATH=$ANDROID_HOME/tools:$(path_remove $ANDROID_HOME/tools)
PATH=$ANDROID_HOME/platform-tools:$(path_remove $ANDROID_HOME/platform-tools)
