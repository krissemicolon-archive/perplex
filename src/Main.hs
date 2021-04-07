{-# LANGUAGE OverloadedStrings #-}

module Main where

import System.Directory
import Brick.Main
import Brick.AttrMap
import Brick.Types
import Brick.Widgets.Core
import Graphics.Vty.Input.Events

main :: IO ()
main = do
    initialState <- buildInitialState
    endState <- defaultMain tuiApp initialState
    print endState

data TuiState =
    TuiState
    deriving (Show, Eq)

data ResourceName =
    ResourceName
    deriving (Show, Eq, Ord)

tuiApp :: App TuiState e ResourceName
tuiApp =
    App {
        appDraw = drawTui,
        appChooseCursor = showFirstCursor,
        appHandleEvent = handleTuiEvent,
        appStartEvent = pure,
        appAttrMap = const $ attrMap mempty []
    }

buildInitialState :: IO TuiState
buildInitialState = pure TuiState

drawTui :: TuiState -> [Widget ResourceName]
drawTui _ts = []

handleTuiEvent :: TuiState -> BrickEvent n e -> EventM n (Next TuiState)
handleTuiEvent s e =
    case e of
    VtyEvent vtye ->
        case vtye of
        EvKey (KChar 'q') [] -> halt s
        _ -> continue s
    _ -> continue s