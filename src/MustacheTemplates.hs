{-# OPTIONS_GHC -fno-warn-missing-signatures -fno-warn-unused-matches #-}
module MustacheTemplates where

import Data.Monoid
import Data.Text.Buildable (build)
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.Builder as TL
import Records

srcHomePagehtml escapeFunction ctx@(HomePageData {title=title, username=username}) = mconcat [
		{-# LINE 1 "src/homePage.html.mustache" #-}
		build "<html>\n    <head>\n        <title>",
		{-# LINE 3 "src/homePage.html.mustache" #-}
		build $ escapeFunction $ TL.unpack $ TL.toLazyText $ build title,
		{-# LINE 3 "src/homePage.html.mustache" #-}
		build "</title>\n    </head>\n    <body>\n        <h1>",
		{-# LINE 6 "src/homePage.html.mustache" #-}
		build $ escapeFunction $ TL.unpack $ TL.toLazyText $ build title,
		{-# LINE 6 "src/homePage.html.mustache" #-}
		build "</h1>\n\n        ",
		{-# LINE 8 "src/homePage.html.mustache" #-}
		if mempty /= username then username0 escapeFunction ctx else mempty,
		{-# LINE 11 "src/homePage.html.mustache" #-}
		build "\n\t\t<p>\n\t\t\tI had to use an external network card tethered to my phone in the\n\t\t\tmiddle of class so that you could see this. I hope you're happy.\n\t\t</p>\n\t\t<script>\n\t\t\t(function(i,s,o,g,r,a,m)",
		{-# LINE 17 "src/homePage.html.mustache" #-}
		build "{",
		{-# LINE 17 "src/homePage.html.mustache" #-}
		build "i['GoogleAnalyticsObject']=r;i[r]=i[r]||function()",
		{-# LINE 17 "src/homePage.html.mustache" #-}
		build "{",
		{-# LINE 17 "src/homePage.html.mustache" #-}
		build "\n\t\t\t(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n\t\t\tm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n\t\t\t})(window,document,'script','//www.google-analytics.com/analytics.js','ga');\n\n\t\t\tga('create', 'UA-44349803-1', 'lunch-advisor.herokuapp.com');\n\t\t\tga('send', 'pageview');\n\t\t</script>\n    </body>\n</html>\n"
	]
	where
	username0 escapeFunction ctx@(HomePageData {title=title, username=username}) = mconcat [
			{-# LINE 9 "src/homePage.html.mustache" #-}
			build "            Welcome, ",
			{-# LINE 9 "src/homePage.html.mustache" #-}
			build $ escapeFunction $ TL.unpack $ TL.toLazyText $ build username,
			{-# LINE 9 "src/homePage.html.mustache" #-}
			build "!\n        "
		]


