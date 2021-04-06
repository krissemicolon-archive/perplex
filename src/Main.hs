module Main where

import Brick

ui :: Widget ()
ui = str "perplex"

main :: IO ()
main = simpleMain ui
