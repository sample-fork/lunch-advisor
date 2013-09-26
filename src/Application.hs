module Application where

import Network.Wai
import Network.Wai.Util (string,stringHeaders',textBuilder)
import Network.HTTP.Types (status200,notFound404)
import Records
import MustacheTemplates

--import Network.Wai (Request(..), Response(..), Application)
--import Control.Monad.IO.Class (liftIO)
--import Network.HTTP.Types.Header (hContentType)
--import qualified Data.ByteString.UTF8 as BU

on404 :: Application
on404 _ = string notFound404 [] "Not Found"

htmlEscape :: String -> String
htmlEscape = concatMap escChar
	where
	escChar '&' = "&amp;"
	escChar '"' = "&quot;"
	escChar '<' = "&lt;"
	escChar '>' = "&gt;"
	escChar c   = [c]

homePage :: Application
homePage conn _ = textBuilder status200
	(stringHeaders' [("Content-Type", "text/html; charset=utf-8")])
	(srcHomePagehtml htmlEscape $ HomePageData "Welcome to Lunch Advisor!" (Just "Ryan"))

instance FromRow Place where
	fromRow = Place <$> field <*> field

instance ToRow Place where
	toRow p = toRow (name p, address p)
