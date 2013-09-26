module Records where

data HomePageData = HomePageData {
	title :: String,
	username :: Maybe String
}

data Place = Place {
	name :: String,
	address :: String -- maybe better type out there
}
