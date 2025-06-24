You need to open 2 shells
In one, run `nix run .#retroarch`
IN RETROARCH VERY IMPORTANT:
Enable Network Commands. To do this, go to Settings -> User Interface and set "Show Advanced Settings" to ON. Then go to Settings -> Network and set "Network Commands" to ON. After doing this, go back to the RetroArch main menu and click Configuration File -> Save Current Configuration

Then, patch your rom, and load the patched rom in retroarch.


Once you have booted the patched rom in retroarch, in the second shell, run `nix run .#client`
This will ask you for info about the connection to archipelago (ex, the port and your name), along with info for connecting to retroarch.
Then it should work and you should be connected i think? If the client disconnects you may need to restart it to get it to connect.