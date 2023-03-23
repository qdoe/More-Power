# More Power

This project is for romhacking of Home Improvement: Power Tool Pursuit for SNES.

The first commit is just some asm to make the game a bit more easily completable, removing the lives and the timer, as well as another bit of asm to give the Power Up item when pressing select.

## Usage

Download hiptp.asm and [asar](https://github.com/RPGHacker/asar/releases/tag/v1.81), then use asar to apply the .asm, using `-D<variable>` to add features:

```
asar.exe -Dnolives -Dnotimer hiptp.asm HomeImprovement.sfc
```

Current options:

| Option    | Description |
| --------- | ----------- |
| nolives   | Lives will no longer decrement |
| notimer   | Timer will no longer decrement |
| powerup   | Pressing select toggles Power Up state |
