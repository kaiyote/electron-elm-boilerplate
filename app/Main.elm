module Main exposing (..)


import Html.App as Html
import Ports exposing (path)
import Update exposing (Flags, Msg(..), update, init, Model)
import View exposing (view)


main : Program Flags
main =
  Html.programWithFlags
    { init = Update.init
    , update = Update.update
    , view = View.view
    , subscriptions = subscriptions
    }


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch [ path PathChanged ]
