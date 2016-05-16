module Routes exposing (Sitemap(..), match, route)


import Route exposing (..)


type Sitemap
  = Home ()
  | Counter ()
  | NotFound


home =
  Home := static ""


counter =
  Counter := static "counter"


sitemap =
  router [ home, counter ]


match : String -> Sitemap
match =
  Route.match sitemap
    >> Maybe.withDefault NotFound


route : Sitemap -> String
route rowt =
  case rowt of
    Home () ->
      reverse home []

    Counter () ->
      reverse counter []

    NotFound ->
      Debug.crash "cannot route to NotFound"
