port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, toFileStructure, compile)
import Html exposing (div)
import Html.App as Html
import Styles.Styles exposing (css)


port files : CssFileStructure -> Cmd msg


cssFiles : CssFileStructure
cssFiles =
  toFileStructure [ ( "app.css", compile css ) ]


main: Program Never
main =
  Html.program
    { init = ( (), files cssFiles )
    , view = \_ -> (div [] [])
    , update = \_ _ -> ( (), Cmd.none )
    , subscriptions = \_ -> Sub.none
    }
