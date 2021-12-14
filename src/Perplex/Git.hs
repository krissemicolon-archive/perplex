{-# LANGUAGE OverloadedStrings #-}

module Perplex.Git where

import Git
import Git.Libgit2
import Control.Monad.IO.Class
import Data.Tagged
import Data.Time
import qualified Data.Text as T

initRepo :: RepositoryOptions -> m a
initRepo opts = withRepository' lgFactory opts
