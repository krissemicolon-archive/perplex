{-# LANGUAGE OverloadedStrings #-}

module Main where

import Brick
import Brick.Main
import Brick.Widgets.Center (center)
import Brick.Widgets.Border (borderWithLabel, vBorder, hBorder)
import Brick.Widgets.Border.Style (unicode)


-- s: application state type
-- e: event type
-- n: resource name type
data App s e n =
    App { appDraw           :: s -> [Widget n]
        , appChooseCursor   :: s -> [CursorLocation n] -> Maybe (CursorLocation n)
        , appHandleEvent    :: s -> BrickEvent n e -> EventM n (Next s)
        , appStartEvent     :: s -> EventM n s
        , appAttrMap        :: s -> AttrMap
        }

ui :: Widget ()
ui = 
    withBorderStyle unicode $
    borderWithLabel (str "perplex") $
    (center (str ".") <+> vBorder <+> center (str "."))

main :: IO ()
main = simpleMain ui