module Records where

--import Database.SQLite.Simple.FromRow (FromRow,fromRow,field)
--import Database.SQLite.Simple.ToRow (ToRow,toRow)
import Database.PostgreSQL.Simple.FromRow (FromRow,fromRow,field)
import Database.PostgreSQL.Simple.ToRow (ToRow,toRow)
import Control.Applicative ((<$>),(<*>))
import Data.Text

data HomePageData = HomePageData {
	choices :: [Restaurant],
	suggestion :: [Restaurant]
}

data Restaurant = Restaurant {
	balls :: Integer,
	name :: Text,
	address :: Text -- maybe better type out there
}

instance FromRow Restaurant where
	fromRow = Restaurant <$> field <*> field <*> field

instance ToRow Restaurant where
	toRow p = toRow (name p, address p)
