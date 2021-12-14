{-# LANGUAGE OverloadedStrings #-}

module Perplex.Widgets where

import Brick
import Brick.Widgets.Core
import Brick.Widgets.Center (center)
import Brick.Widgets.Border (borderWithLabel, vBorder, hBorder)
import Brick.Widgets.Border.Style (unicode)

frame :: Widget () -> Widget ()
frame w = withBorderStyle unicode $ borderWithLabel (str "perplex") $ w

homeLayout :: Widget () -> Widget () -> Widget ()
homeLayout ws wh = ws <+> vBorder <+> wh

status :: Widget ()
status = str "status"

lamoe :: Widget ()
lamoe = fill 'x'

history :: Widget ()
history = center $ str "history" <=> str "lamo"
