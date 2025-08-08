# Touchpath

This is the configuration used to make
my touchpad recognize double tap instead
of clicking for everything.

- Create a configuration file for
  the touchpad in the directory `/etc/X11/xorg.conf.d/`.
  For example, name it `50-touchpad.conf`.

- Open the configuration file with
  a text editor like `nano` or `nvim`. For example:

  ```bash
  sudo nano /etc/X11/xorg.conf.d/50-touchpad.conf
  ```

- Add the following lines to the configuration file:

  ```plaintext
  Section "InputClass"
      Identifier "touchpad"
      Driver "libinput"
      MatchIsTouchpad "on"
      Option "Tapping" "on"
      Option "TappingButtonMap" "lrm"
  EndSection
  ```

This enables tapping on the touchpad
and maps double tap to the left, right,
and middle mouse buttons (`"lrm"`).
If you want double tap to only activate
the right mouse button, you can change `"lrm"` to `"rm"`.

- Save the file and exit the editor.

- Restart the Xorg server or reboot your system for the changes to take effect.
