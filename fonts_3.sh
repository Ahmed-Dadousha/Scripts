#!/bin/bash

printf "\n\e[34m%s\e[0m\n" "================================================================================================= Setting Fonts ============================================================================="

# Extract fonts
cd Data
find . -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;

printf "\n\e[34m%s\e[0m\n" "================================================================================================= Install Fonts ============================================================================="
# Install fonnts to the system
sudo cp -r Arimo Cousine Tinos Noto_Sans_Arabic /usr/share/fonts/

printf "\n\e[34m%s\e[0m\n" "================================================================================================= Write Config  ============================================================================="
# Config Files 
mkdir ~/.config/fontconfig

string=$(cat << EOF 
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
  <!-- Set preferred serif, sans serif, and monospace fonts. -->
  <alias>
   <family>sans-serif</family>
   <prefer>
    <family>Arimo</family>
    <family>Noto Sans Arabic</family>
   </prefer>
  </alias>

  <alias>
   <family>serif</family>
   <prefer>
    <family>Tinos</family>
    <family>Noto Sans Arabic</family>
   </prefer>
  </alias>

  <alias>
   <family>Sans</family>
   <prefer>
    <family>Arimo</family>
    <family>Noto Sans Arabic</family>
   </prefer>
  </alias>

  <alias>
   <family>monospace</family>
   <prefer>
    <family>Cousine</family>
    <family>Noto Sans Arabic</family>
   </prefer>
  </alias>
  <!-- Aliases for commonly used MS fonts. -->
  <match>
    <test name="family"><string>Arial</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Helvetica</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Verdana</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Tahoma</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <!-- Insert joke here -->
    <test name="family"><string>Comic Sans MS</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Arimo</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Times New Roman</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Tinos</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Times</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Tinos</string>
    </edit>
  </match>
  <match>
    <test name="family"><string>Courier New</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>Cousine</string>
    </edit>
  </match>
</fontconfig>

EOF

)

echo $string > ~/.config/fontconfig/fonts.conf
printf "\n\e[34m%s\e[0m\n" "================================================================================================= Update fonts =============================================================================="

sudo fc-cache -fv
printf "\n\e[33m%s\e[0m\n" "================================================================================================= Done ====================================================================================="
