module Records where

--import Database.SQLite.Simple.FromRow (FromRow,fromRow,field)
--import Database.SQLite.Simple.ToRow (ToRow,toRow)
import Database.PostgreSQL.Simple.FromRow (FromRow,fromRow,field)
import Database.PostgreSQL.Simple.ToRow (ToRow,toRow)
import Control.Applicative ((<$>),(<*>))
import Data.Text

data HomePageData = HomePageData {
	places :: [Restaurant]
}

data Restaurant = Restaurant {
	name :: String,
	address :: String -- maybe better type out there
}

instance FromRow Restaurant where
	fromRow = Restaurant <$> field <*> field

instance ToRow Restaurant where
	toRow p = toRow (name p, address p)
