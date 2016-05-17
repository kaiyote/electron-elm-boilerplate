module RoutesTests exposing (..)

import ElmTest exposing (..)
import Testable.TestContext exposing (..)
import Routes exposing (match, route, Sitemap(..))

tests : Test
tests =
  suite "Routes"
    [ test "'/' matches Home" <| assertEqual (match "/") (Home ())
    , test "'/' matches Counter" <| assertEqual (match "/counter") (Counter ())
    , test "bad route matches Not Found" <| assertEqual (match "/nop") (NotFound)
    , test "Home () routes to '/'" <| assertEqual (route <| Home ()) "/"
    , test "Counter () routes to '/counter'" <| assertEqual (route <| Counter ()) "/counter"
    ]
