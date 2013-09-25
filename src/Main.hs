module Main (main) where

import Network.Wai.Handler.Warp (run)
import Network.Wai.Dispatch (dispatch)
import Application (on404)
import Routes (routes)

main :: IO ()
main = do
	let port = 3000
	putStrLn $ "Listening on port " ++ show port
	run port $ dispatch on404 routes
