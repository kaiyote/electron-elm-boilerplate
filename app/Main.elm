module Main exposing (..)


import Html.App as Html
import Ports exposing (path, swap)
import Update exposing (Flags, Msg(..), update, init, Model)
import View exposing (view)


main : Program Flags
main =
  Html.programWithFlags
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.batch [ path PathChanged ]
    }
