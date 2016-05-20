module Styles.Styles exposing (CssClasses(..), homeNamespace, counterNamespace, css)

import Css exposing (..)
import Css.Elements exposing (body, h2, a)
import Css.Namespace exposing (namespace)
import Html.CssHelpers exposing (withNamespace)
import List exposing (concat)


type CssClasses
  = Container
  | BackButton
  | Counter
  | ButtonGroup
  | Button


homeNamespace =
  withNamespace "home"


counterNamespace =
  withNamespace "counter"


css =
  stylesheet <| concat
    [
        [ body
            [ position relative
            , color white
            , height (vh 100)
            , backgroundColor (hex "232C39")
            , fontFamilies [ "Arial", "Helvetica", "Helvetica Neue" ]
            , overflowY hidden
            , property "background-image" "linear-gradient(45deg, rgba(0, 216, 255, .5) 10%, rgba(0, 1, 127, .7))"
            ]
        , h2
            [ margin zero
            , fontSize (Css.rem 2.25)
            , fontWeight bold
            , color white
            , property "letter-spacing" "-.025em"
            ]
        , a
            [ color white
            , opacity (float 0.75)
            , textDecoration none
            , hover [ opacity (int 1) ]
            ]
        ]
    , namespace homeNamespace.name
        [ (.) Container
            [ position absolute
            , top (pct 30)
            , left (px 10)
            , textAlign center
            , descendants
                [ h2 [ fontSize (Css.rem 5) ]
                , a [ fontSize (Css.rem 1.4) ]
                ]
            ]
        ]
    , namespace counterNamespace.name
        [ (.) BackButton [ position absolute ]
        , (.) Counter
            [ position absolute
            , top (pct 30)
            , left (pct 45)
            , fontSize (Css.rem 10)
            , fontWeight bold
            , property "letter-spacing" "-.025em"
            ]
        , (.) ButtonGroup
            [ position relative
            , top (px 500)
            , width (px 480)
            , margin2 zero auto
            ]
        , (.) Button
            [ fontSize (Css.rem 1.6)
            , fontWeight bold
            , backgroundColor white
            , borderRadius (pct 50)
            , margin (px 10)
            , width (px 100)
            , height (px 100)
            , opacity (float 0.7)
            , property "cursor" "pointer"
            , hover
                [ color white
                , backgroundColor (rgba 0 0 0 0.5 )
                ]
            ]
        ]
    ]


white : Color
white =
    hex "FFFFFF"
