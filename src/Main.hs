module Main (main) where

import Network.Wai.Handler.Warp (run)
import Network.Wai.Dispatch (dispatch)
import Application (on404)
import Routes (routes)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import System.Environment (getEnv)
import Network.Wai.Middleware.Static (static)
import Database.PostgreSQL.Simple (connectPostgreSQL,close)

main :: IO ()
main = do
	port <- fmap read $ getEnv "PORT"
	dburl <- fmap read $ getEnv "DATABASE_URL"
	conn <- connectPostgreSQL dburl
	putStrLn $ "Listening on port " ++ show port
	run port $ logStdoutDev $ static $ dispatch on404 (routes conn)
	close conn
