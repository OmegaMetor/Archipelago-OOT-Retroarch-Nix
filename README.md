Many thanks to [JoshuaEagles](https://github.com/JoshuaEagles) for actually creating the client and modified core that this wraps.

You can find the client's source at https://github.com/JoshuaEagles/Archipelago.RetroArchClient

You need to open 2 shells

In one, run `nix run .#retroarch`

Then, patch your rom, and load the patched rom in retroarch.

Once you have booted the patched rom in retroarch, in the second shell, run `nix run .#client`

This will ask you for info about the connection to archipelago (ex, the port and your name), along with info for connecting to retroarch.

Then it should work and you should be connected i think? If the client disconnects you may need to restart it to get it to connect.