MOUSEKEY_ENABLE = no
CONSOLE_ENABLE  = no
RGBLIGHT_ENABLE = yes
OLED_ENABLE     = yes
OLED_DRIVER     = SSD1306
LTO_ENABLE      = yes
VIA_ENABLE      = no
WPM_ENABLE      = yes
SRC += oled/oled-bongocat.c oled/oled-icons.c
OPT_DEFS += -DLEFTCAT
