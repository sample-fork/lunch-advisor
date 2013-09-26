{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Routes where

import Application
import Control.Monad (ap)
import Data.Text (pack)
import Web.PathPieces (fromPathPiece, fromPathMultiPiece)
import Yesod.Routes.Dispatch (Route(..), Piece(Static, Dynamic))

routes  = [
		Route {
			rhPieces = [Static (pack "GET")],
			rhHasMulti = False,
			rhDispatch = (\(_:_) -> return (homePage ))
		}
	]
