module Main exposing (..)


import Html.App as Html
import Ports exposing (path, postDelay)
import Update exposing (Flags, Msg(..), update, init, Model)
import View exposing (view)


main : Program Flags
main =
  Html.programWithFlags
    { init = Update.init
    , update = Update.update
    , view = View.view
    , subscriptions = \_ -> Sub.batch [ path PathChanged, postDelay Increment ]
    }
