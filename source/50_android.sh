
if [[ "$OSTYPE" =~ "^darwin" ]]; then
  JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
  export JAVA_HOME
  
  ANDROID_HOME="$HOME/Development/adt-bundle-mac-x86_64/sdk"
  export ANDROID_HOME
  
  PATH=$ANDROID_HOME/tools:$(path_remove $ANDROID_HOME/tools)
  PATH=$ANDROID_HOME/platform-tools:$(path_remove $ANDROID_HOME/platform-tools)
fi