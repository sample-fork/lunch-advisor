module Application where

import Network.Wai
import Network.Wai.Util (string,stringHeaders',textBuilder,noStoreFileUploads)
import Network.Wai.Parse (parseRequestBody)
import Network.HTTP.Types (status200,notFound404)
import Records
import MustacheTemplates
--import Database.SQLite.Simple (query_)
--import Database.SQLite.Simple.Internal (Connection)
import Database.PostgreSQL.Simple (query_)
import Database.PostgreSQL.Simple.Internal (Connection)
import Control.Monad.IO.Class (liftIO)
import Data.String (fromString)
import Data.Maybe (maybeToList)
import Data.Random.Extras (safeChoice)
import Data.Random.RVar (runRVar)
import Data.Random (StdRandom(StdRandom))

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

{-
getParams :: Request -> [Params]
getParams req = do
	(params,_) <- parseRequestBody noStoreFileUploads req
	params
-}

homePage :: Connection -> Application
homePage conn req = liftIO $ do
	restaurants <- query_ conn (fromString "select * from restaurants") :: IO [Restaurant]
	textBuilder status200
		(stringHeaders' [("Content-Type", "text/html; charset=utf-8")])
		(srcHome htmlEscape $ HomePageData restaurants [])

choose :: Connection -> Application
choose conn req = liftIO $ do
	restaurants <- query_ conn (fromString "select * from restaurants") :: IO [Restaurant]
	choice <- mapM (flip runRVar StdRandom) $ maybeToList $ safeChoice restaurants
	textBuilder status200
		(stringHeaders' [("Content-Type", "text/html; charset=utf-8")])
		(srcHome htmlEscape $ HomePageData restaurants choice)

{-
newPlace :: Connection -> Application
newPlace conn req = do
	obj <- from query string
	execute conn (fromString "insert into restaurants values (?)") obj
	homePage conn req
-}
