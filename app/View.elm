module View exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (href)
import Html.Events exposing (onClick)
import Routes exposing (Sitemap(..))
import Update exposing (Msg(..), Model)
import Styles.Styles as Css exposing (homeNamespace, counterNamespace)


notFound : Html Msg
notFound =
  h1 [] [ text "Page not found" ]


home : Html Msg
home =
  let
    { class } =
      homeNamespace
  in
    div []
      [ div [ class [ Css.Container ] ]
          [ h2 [] [ text "Home" ]
          , link (Counter ()) (text "to Counter")
          ]
      ]


counter : Model -> Html Msg
counter model =
  let
    { class } =
      counterNamespace
  in
    div []
      [ div [ class [ Css.BackButton ] ] [ link (Home ()) (i [ Attr.class "fa fa-arrow-left fa-3x" ] []) ]
      , div [ class [ Css.Counter ] ] [ text (toString model.count) ]
      , div [ class [ Css.ButtonGroup ] ]
          [ button [ class [ Css.Button ], onClick Increment ] [ i [ Attr.class "fa fa-plus" ] [] ]
          , button [ class [ Css.Button ], onClick Decrement ] [ i [ Attr.class "fa fa-minus" ] [] ]
          , button [ class [ Css.Button ], onClick IncrementIfOdd ] [ text "odd" ]
          , button [ class [ Css.Button ], onClick IncrementAsync ] [ text "async" ]
          ]
      ]


view : Model -> Html Msg
view model =
  case model.route of
    Home () ->
      home

    Counter () ->
      counter model

    NotFound ->
      notFound


link : Sitemap -> Html Msg -> Html Msg
link route content =
  let
    opts =
      { preventDefault = True
      , stopPropagation = False
      }
  in
    a
      [ href ("#" ++ (Routes.route route))
      , onClick (RouteTo route)
      ]
      [ content ]
