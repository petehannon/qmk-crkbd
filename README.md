# A complete QMK build for the Corne CRKBD R2G, with Bongocat!

# What?

I picked up a build kit from the good people at [Mechboards UK](https://mechboards.co.uk/) some months ago. I threw on some [Momoka Frogs](https://mechboards.co.uk/products/momoka-frog?_pos=1&_sid=87d18472a&_ss=r) and XDA Matcha Keycaps, and there it was, a pretty nice board to play around with.

Before long I wondered what else could be dropped on the OLED screens apart from the default, so here we are!

Aside: Please do check out the awesome [Discord community for Mechboards UK](https://discord.com/channels/336826782772756481/808407534406336552)

# Why?

![Bongocat](https://c.tenor.com/NjbLQCvQoC8AAAAC/bongo-cat.gif)

I honestly cannot remember why, but a responsive bongocat (i.e. reacting as I type) was what my brain decided the best use of one of the OLED screens would be.

I was not even close to being first to thinking of this. Some examples with limited documentation existed, but there nothing really cohesive that brought it all together, and made it easy on a newcomer to QMK like me.

# How?

## Flashing

1. Install and setup ![QMK](https://docs.qmk.fm/#/), which will allow you to customise and compile your own keyboard firmware
2. Follow their guide for ![building your first firmware](https://docs.qmk.fm/#/newbs_building_firmware)
3. When it comes to ![flashing](https://docs.qmk.fm/#/newbs_flashing)
    - Be sure to select the correct microcontroller, [atmega32u4](https://user-images.githubusercontent.com/46349689/156472268-c167a75e-4fa3-44d0-86c1-7e31ff28057f.png) before flashing
    - Do *not* connect the keyboard through any USB hubs, QMK Toolbox will probably not be able to detect the device
    - There is a reset pin on the bottom of each half of the PCB, and yes, you need to flash both sides individually
4. All being well, you should see something akin to the following

![image](https://user-images.githubusercontent.com/46349689/156478764-9c2d476b-9751-4d6b-9e83-5e715f5694a8.png)

## Customisation

The code in this repo is based largely on ![filterpaper](https://github.com/filterpaper/qmk_userspace/tree/main/oled)'s samples and instructions, but when starting from a base/clean build of QMK, a few steps were missing. If you wish, you can gloss over all the below, clone this repo, flash your board, and get on with your day!

If however you are interested, here are some of the issues I've encountered:

- Once the additional code is imported, the compiler will flag duplicate definitions of certain functions. Remove the default definitions supplied by the base QMK implementation
- The ![master](https://github.com/petehannon/qmk-crkbd/blob/c370ce59b898130d0476dd6f52dc0cec7a0eb3c1/src/config.h#L26) setting should match whichever half of the split you connect the USB cable to, unless you want to configure handedness. See ![EEPROM](https://docs.qmk.fm/#/feature_split_keyboard?id=handedness-by-eeprom)

- With all the appropriate ![rules](https://github.com/petehannon/qmk-crkbd/blob/main/src/rules.mk) and imports specified to enable Bongocat, you're likely to have to make a sacrifice somewhere in features/functionality due to the limited amount of space on the board. My linked ruleset has been optimised based on this very useful article from ![Thomas Baart](https://thomasbaart.nl/2018/12/01/reducing-firmware-size-in-qmk/)
- If support for ![VIA](https://www.caniusevia.com/) is important to you (`VIA_ENABLE`), you will likely have to sacrifice some RGB options, either via disabling `RGBLIGHT_ENABLE` or undefining some of the prebuilt patterns

The ruleset defined here has VIA disabled, as I was personally comfortable configuring keymaps in code, and lighting on-the-fly.

I also took the liberty to tweak some of the secondary display functionality, adding a dynamic label to indicate which layer was active.

## Keymap

The keymap supplied here is somewhat customised from the default. It works for me, it may not work for you. ![Here](https://github.com/qmk/qmk_firmware/blob/develop/docs/keymap.md) is the documentation to help you configure your own maps, and a ![keycodes](https://github.com/qmk/qmk_firmware/blob/develop/docs/keycodes.md) reference guide.
