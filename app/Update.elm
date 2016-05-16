module Update exposing (Flags, Msg(..), Model, init, update)


import Routes exposing (Sitemap(..))
import Ports exposing (pushPath)
import Task


type alias Flags =
  { path : String
  }


type alias Model =
  { route : Sitemap
  , count : Int
  }


type Msg
  = PathChanged String
  | RouteTo Sitemap
  | Increment
  | Decrement
  | IncrementIfOdd


update : Msg -> Model -> ( Model, Cmd Msg)
update msg model =
  case Debug.log "message" msg of
    PathChanged path ->
      ( { model | route = Routes.match path }, Cmd.none )

    RouteTo route ->
      ( model, pushPath (Routes.route route) )

    Increment ->
      ( { model | count = model.count + 1 }, Cmd.none )

    Decrement ->
      ( { model | count = model.count - 1 }, Cmd.none )

    IncrementIfOdd ->
      if model.count % 2 == 1 then
        ( { model | count = model.count + 1 }, Cmd.none )
      else
        ( model, Cmd.none )


init : Flags -> ( Model, Cmd Msg )
init { path } =
  ( Model (Routes.match path) 0, Cmd.none )
