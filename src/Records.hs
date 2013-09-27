module Records where

--import Database.SQLite.Simple.FromRow (FromRow,fromRow,field)
--import Database.SQLite.Simple.ToRow (ToRow,toRow)
import Database.PostgreSQL.Simple.FromRow (FromRow,fromRow,field)
import Database.PostgreSQL.Simple.ToRow (ToRow,toRow)
import Control.Applicative ((<$>),(<*>))

data HomePageData = HomePageData {
	places :: [Restaurant]
}

data Restaurant = Restaurant {
	name :: Text,
	address :: Text -- maybe better type out there
}

instance FromRow Restaurant where
	fromRow = Restaurant <$> field <*> field

instance ToRow Restaurant where
	toRow p = toRow (name p, address p)
