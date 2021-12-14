{-# LANGUAGE OverloadedStrings #-}

module Main where

import Perplex.Git
import Perplex.Widgets

import Brick
import Brick.Main
import Git.Types

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

main :: IO ()
main = simpleMain initialState
    where
        initialState = frame $ homeLayout status history
        repo = initRepo defaultRepositoryOptions
