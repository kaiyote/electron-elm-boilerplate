module CssStyles exposing (..)

import Css exposing (..)
import Css.Elements exposing (body, h2, a)
import Css.Namespace exposing (namespace)


type CssClasses
  = Container
  | BackButton
  | Counter
  | ButtonGroup
  | Button


homeNamespace =
  "home"


counterNamespace =
  "counter"


css =
  stylesheet << concat
    [
        [ body
            [ position relative
            , color (hex "FFFFFF")
            , height (vh 100)
            , backgroundColor (hex "232C39")
            , fontFamilies [ "Arial", "Helvetica", "Helvetica Neue" ]
            , overflowY hidden
            ]
        , h2
            [ margin zero
            , fontSize (Css.rem 2.25)
            , fontWeight bold
            , color (hex "FFFFFF")
            ]
        , a
            [ color (hex "FFFFFF")
            , opacity (float 0.75)
            , hover [ opacity (int 1) ]
            ]
        ]
    , namespace homeNamespace
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
    , namespace counterNamespace
        [ (.) BackButton [ position absolute ]
        , (.) Counter
            [ position absolute
            , top (pct 30)
            , left (pct 45)
            , fontSize (Css.rem 10)
            , fontWeight bold
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
            , backgroundColor (hex "FFFFFF")
            , borderRadius (pct 50)
            , margin (px 10)
            , width (px 100)
            , height (px 100)
            , opacity (float 0.7)
            , hover
                [ color (hex "FFFFFF")
                , backgroundColor (rgba 0 0 0 0.5 )
                ]
            ]
        ]
    ]
