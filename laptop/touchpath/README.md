# TouchPath

This is the configuration used to make my touchpad recognize double tap instead of clicking for everything.

1. Create a configuration file for the touchpad in the directory `/etc/X11/xorg.conf.d/`. For example, name it `50-touchpad.conf`.

2. Open the configuration file with a text editor like `nano` or `vi`. For example:

   ```bash
   sudo nano /etc/X11/xorg.conf.d/50-touchpad.conf
   ```

3. Add the following lines to the configuration file:

   ```plaintext
   Section "InputClass"
       Identifier "touchpad"
       Driver "libinput"
       MatchIsTouchpad "on"
       Option "Tapping" "on"
       Option "TappingButtonMap" "lrm"
   EndSection
   ```

   This enables tapping on the touchpad and maps double tap to the left, right, and middle mouse buttons (`"lrm"`). If you want double tap to only activate the right mouse button, you can change `"lrm"` to `"rm"`.

4. Save the file and exit the editor.

5. Restart the Xorg server or reboot your system for the changes to take effect.
