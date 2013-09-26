module Main (main) where

import Network.Wai.Handler.Warp (run)
import Network.Wai.Dispatch (dispatch)
import Application (on404)
import Routes (routes)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import System.Environment (getEnv)

main :: IO ()
main = do
	port <- fmap read $ getEnv "PORT"
	putStrLn $ "Listening on port " ++ show port
	run port $ logStdoutDev $ dispatch on404 routes
