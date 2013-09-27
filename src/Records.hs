module Records where

--import Database.SQLite.Simple.FromRow (FromRow,fromRow,field)
--import Database.SQLite.Simple.ToRow (ToRow,toRow)
import Database.PostgreSQL.Simple.FromRow (FromRow,fromRow,field)
import Database.PostgreSQL.Simple.ToRow (ToRow,toRow)
import Control.Applicative ((<$>),(<*>))

data HomePageData = HomePageData {
	places :: [Place]
}

data Place = Place {
	name :: String,
	address :: String -- maybe better type out there
}

instance FromRow Place where
	fromRow = Place <$> field <*> field

instance ToRow Place where
	toRow p = toRow (name p, address p)
