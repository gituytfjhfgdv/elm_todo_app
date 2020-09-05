module Main exposing (Model, Msg(..), Todo, init, main, update, view, viewTable, viewTr)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)



-- model


type alias Todo =
    { title : String
    , description : String
    }


type alias Model =
    { todos : List Todo }



-- 初期値


init : Model
init =
    { todos = [] }


type Msg
    = Add



-- update


update : Msg -> Model -> Model
update msg model =
    case msg of
        -- Addイベント：moldelにtodo方のデータを追加する
        Add ->
            -- タイトルが「Todoタイトル」、詳細が「Todo詳細」となるTodo型のデータをModelに追加
            { model | todos = Todo "Todoタイトル" "Todo詳細" :: model.todos }



-- view


view : Model -> Html Msg
view model =
    div []
        [ viewTable model.todos
        , button [ onClick Add ] [ text "Add" ]
        ]


viewTable : List Todo -> Html Msg
viewTable todos =
    table []
        [ thead []
            [ th [] [ text "Title" ]
            , th [] [ text "Description" ]
            ]
        , tbody [] (List.map viewTr todos)
        ]


viewTr : Todo -> Html Msg
viewTr todo =
    tr []
        [ td [] [ text todo.title ]
        , td [] [ text todo.description ]
        ]



-- Main関数


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
