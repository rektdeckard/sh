#!/bin/bash
## Filter Map
## created 2019.6.15
## author Tobias Fried <friedtm@gmail.com>

## A bash script for Android Icon Pack creators
## Maps drawable resources from a appfilter.xml file to appmap.xml and theme_resources.xml files

LOCATION="$1"
APPFILTER="appfilter.xml"
APPMAP="appmap.xml"
THEMERESOURCES="theme_resources.xml"
WARNING="<!-- AUTOGENERATED FILE -- DELETE THIS COMMENT AFTER REVIEW -->"

# Get confirmation

get_confirmation() {
  read -n 1 -sp "This will overwrite $APPMAP and $THEMERESOURCES files in this directory, if they exist. Continue? [y]es or [n]o:  " CONFIRM
  echo ""
  case $CONFIRM in
    y|Y)
      ;;
    n|N)
      echo "Cancelled"
      exit 0
      ;;
    *)
      echo "Invalid response"
      get_confirmation
      ;;
  esac
}

# Move to file location, if given

pushd . > /dev/null

echo -n "Locating $APPFILTER..."
if [[ ! -z $LOCATION ]]; then
  cd $( dirname "$LOCATION")
fi

# Test if file exists

if [[ -f $APPFILTER ]]; then

  echo "Done"
  get_confirmation

  # Extract version number

  APPVERSION="$(sed -n 's/.*<version>\([0-9]*\)<\/version>.*/\1/p' $APPFILTER)"
  echo "App versionCode $APPVERSION"

  # Generate appmap.xml

  echo -n "Generating $APPMAP..."
  echo "$WARNING" > "$APPMAP"
  echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<appmap>

    <!-- SUPPORTED LAUNCHERS -->
    <!-- Atom Launcher -->
" >> "$APPMAP" 

  sed -e '1,31d; s:<item component="ComponentInfo\([^/]*\).:<item class=":; s:}::; s:drawable=:name=:g; s/\(<.\?\)resources>/\1appmap>/g' "$APPFILTER" >> "$APPMAP"
  echo "Done"

  # Generate theme_resources.xml

  echo -n "Generating $THEMERESOURCES..."
  echo "$WARNING" > "$THEMERESOURCES"
  echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<Theme version=\"$APPVERSION\">

    <!-- SUPPORTED LAUNCHERS -->
    <!-- LG Home -->

    <Label value=\"Phosphor Carbon\" />
    <Wallpaper image=\"lg_homescreen_wallpaper\" />
    <LockScreenWallpaper image=\"lockscreen_wallpaper\" />
    <ThemePreview image=\"lg_homescreen_preview\" />
    <ThemePreviewWork image=\"lg_homescreen_preview_work\" />
    <ThemePreviewMenu image=\"lg_homescreen_preview_menu\" />
    <DockMenuAppIcon selector=\"apps\" />
" >> "$THEMERESOURCES"

  sed -e '1,31d; s:<item component="ComponentInfo{:<AppIcon name=":; s:}::; s:drawable=:image=:g; s/\(<.\?\)resources>/\1Theme>/g' "$APPFILTER" >> "$THEMERESOURCES"
  echo "Done"

else
  echo "Required file appfilter.xml not found."
fi

popd > /dev/null
