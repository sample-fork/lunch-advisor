{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
module Routes where

import Application
import Control.Monad (ap)
import Data.Text (pack)
import Web.PathPieces (fromPathPiece, fromPathMultiPiece)
import Yesod.Routes.Dispatch (Route(..), Piece(Static, Dynamic))

routes arg1 = [
		Route {
			rhPieces = [Static (pack "GET")],
			rhHasMulti = False,
			rhDispatch = (\(_:_) -> return (homePage arg1))
		},
		Route {
			rhPieces = [Static (pack "GET"),Static (pack "choose")],
			rhHasMulti = False,
			rhDispatch = (\(_:_:_) -> return (choicePage arg1))
		}
	]
