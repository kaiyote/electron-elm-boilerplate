module RoutesTests exposing (..)

import ElmTest exposing (..)
import Routes exposing (match, route, Sitemap(..))

tests : Test
tests =
  suite "Routes"
    [ test "'/' matches Home"
        <| assertEqual (Home ()) (match "/hi")
    , test "'/' matches Counter"
        <| assertEqual (Counter ()) (match "/counter")
    , test "bad route matches Not Found"
        <| assertEqual NotFound (match "/nop")
    , test "Home () routes to '/'"
        <| assertEqual "/" (route <| Home ())
    , test "Counter () routes to '/counter'"
        <| assertEqual "/counter" (route <| Counter ())
    ]
