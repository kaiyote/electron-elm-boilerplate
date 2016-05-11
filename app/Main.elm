module Main exposing (..)

import Html exposing (Html, text)
import Html.App as Html
import Hello.World exposing (hello)
import Ports exposing (swap, Msg(Swap))


main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL


type alias Model = String


init : (Model, Cmd Msg)
init =
  (hello, Cmd.none)


-- UPDATE


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Swap _ ->
      (model, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  swap Swap


-- VIEW


view : Model -> Html Msg
view model =
  text model
