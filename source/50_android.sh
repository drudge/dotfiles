
if [[ "$OSTYPE" =~ "^darwin" ]]; then
  JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
  export JAVA_HOME
  
  if [ -e "/Applications/Android Studio.app/sdk" ]; then
    ANDROID_HOME="/Applications/Android Studio.app/sdk"
  else
    ANDROID_HOME="$HOME/Development/adt-bundle-mac-x86_64/sdk"
  fi
  
  export ANDROID_HOME
  
  PATH=$ANDROID_HOME/tools:$(path_remove $ANDROID_HOME/tools)
  PATH=$ANDROID_HOME/platform-tools:$(path_remove $ANDROID_HOME/platform-tools)
  
  export BUILD_MAC_SDK_EXPERIMENTAL=1
fi