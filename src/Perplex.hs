{-# LANGUAGE OverloadedStrings #-}

module Main where

import Perplex.Widgets

import Brick
import Brick.Main

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

-- todo:
-- [ ] layout
-- [ ] gitlib hello world

main :: IO ()
main = simpleMain initialState
    where
        initialState = frame $ homeLayout status history

{-
main :: IO ()
main = do
  let app = App { ... }
      initialState = frame $ homeLayout status history
  finalState <- defaultMain app initialState
-}
