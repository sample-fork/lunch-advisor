{-# OPTIONS_GHC -fno-warn-missing-signatures -fno-warn-unused-matches #-}
module MustacheTemplates where

import Data.Monoid
import Data.Text.Buildable (build)
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Builder as TL
import Records

srcHome escapeFunction ctx@(HomePageData {places=places}) = mconcat [
		{-# LINE 1 "src/home.mustache" #-}
		build "<html>\n    <head>\n        <title>Lunch Advisor</title>\n    </head>\n    <body>\n        <h1>Welcome to Lunch Advisor!</h1>\n\n\t\t<dl>\n\t\t",
		{-# LINE 9 "src/home.mustache" #-}
		mconcat $ map (places0 escapeFunction) places,
		{-# LINE 12 "src/home.mustache" #-}
		build "\t\t</dl>\n\n\t\t<script>\n\t\t\t(function(i,s,o,g,r,a,m)",
		{-# LINE 15 "src/home.mustache" #-}
		build "{",
		{-# LINE 15 "src/home.mustache" #-}
		build "i['GoogleAnalyticsObject']=r;i[r]=i[r]||function()",
		{-# LINE 15 "src/home.mustache" #-}
		build "{",
		{-# LINE 15 "src/home.mustache" #-}
		build "\n\t\t\t(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n\t\t\tm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n\t\t\t})(window,document,'script','//www.google-analytics.com/analytics.js','ga');\n\n\t\t\tga('create', 'UA-44349803-1', 'lunch-advisor.herokuapp.com');\n\t\t\tga('send', 'pageview');\n\t\t</script>\n    </body>\n</html>\n"
	]
	where
	places0 escapeFunction ctx@(Restaurant {balls=balls, name=name, address=address}) = mconcat [
			{-# LINE 10 "src/home.mustache" #-}
			build "\t\t\t",
			{-# LINE 10 "src/home.mustache" #-}
			srcPlace escapeFunction ctx,
			{-# LINE 10 "src/home.mustache" #-}
			build "\n\t\t"
		]

srcPlace escapeFunction ctx@(Restaurant {balls=balls, name=name, address=address}) = mconcat [
		{-# LINE 1 "src/place.mustache" #-}
		build "<dt>",
		{-# LINE 1 "src/place.mustache" #-}
		build $ escapeFunction $ TL.unpack $ TL.toLazyText $ build name,
		{-# LINE 1 "src/place.mustache" #-}
		build "</dt>\n<dd>",
		{-# LINE 2 "src/place.mustache" #-}
		build $ escapeFunction $ TL.unpack $ TL.toLazyText $ build address,
		{-# LINE 2 "src/place.mustache" #-}
		build "</dd>\n"
	]


