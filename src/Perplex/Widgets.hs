{-# LANGUAGE OverloadedStrings #-}

module Perplex.Widgets where

import Brick
import Brick.Widgets.Core
import Brick.Widgets.Center (center)
import Brick.Widgets.Border (borderWithLabel, vBorder, hBorder)
import Brick.Widgets.Border.Style (unicode)

frame :: Widget () -> Widget ()
frame w = withBorderStyle unicode $ borderWithLabel (str "perplex") $ w

homeLayout :: Widget () => w -> w -> w
homeLayout ws wh = ws <+> vBorder <+> wh

commitLayout :: Widget () w => w -> w -> w
commitLayout wm wh = wm <+> vBorder <+> wh

cmessage :: String -> Widget ()
cmessage s = str s

status :: Widget ()
status = str "status"

lamoe :: Widget ()
lamoe = fill 'x'

history :: Widget ()
history = center $ str "history" <=> str "lamo"
