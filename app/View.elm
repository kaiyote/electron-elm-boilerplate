module View exposing (view)


import Html exposing (..)
import Html.Attributes exposing (href, class)
import Html.Events exposing (onClick)
import Routes exposing (Sitemap(..))
import Update exposing (Msg(..), Model)


notFound : Html Msg
notFound =
  h1 [] [ text "Page not found" ]


home : Html Msg
home =
  div []
    [ div [ class "container" ]
        [ h2 [] [ text "Home" ]
        , link (Counter ()) (text "to Counter")
        ]
    ]


counter : Model -> Html Msg
counter model =
  div []
    [ div [ class "backButton" ] [ link (Home ()) (i [ class "fa fa-arrow-left fa-3x" ] [ ]) ]
    , div [ class "counter" ] [ text (toString model.count) ]
    , div [ class "btnGroup" ]
        [ button [ class "btn", onClick (Increment Nothing) ]
            [ i [ class "fa fa-plus" ] []
            ]
        , button [ class "btn", onClick Decrement ]
            [ i [ class "fa fa-minus" ] []
            ]
        , button [ class "btn", onClick IncrementIfOdd ]
            [ text "odd"
            ]
        , button [ class "btn", onClick IncrementAsync ]
            [ text "async"
            ]
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
