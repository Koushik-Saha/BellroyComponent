module ProductCardComponent exposing (main)

import Browser
import Html exposing (Html, div, img, text, span)
import Html.Attributes exposing (class, src, alt, style)
import Html.Events exposing (onClick)


-- MODEL

type alias Model =
    { selectedColor : String }

init : Model
init =
    { selectedColor = "black" }


-- UPDATE

type Msg
    = SelectColor String

update : Msg -> Model -> Model
update msg model =
    case msg of
        SelectColor color ->
            { model | selectedColor = color }


-- VIEW

view : Model -> Html Msg
view model =
    div [ class "card" ]
        [ img
            [ class "product-image"
            , src "https://images.ctfassets.net/9gtqfrlcatsp/7ZxgI7o0yCtdac77LbdIbI/eac6ee3c91f03e5354c878bc4e65b8cb/Black-Venture-Sling-6L-1-Front_Desktop.jpg"
            , alt "Venture Sling 6L"
            ]
            []
        , div [ class "product-name" ] [ text "Venture Sling 6L" ]
        , div [ class "price" ] [ text "$129" ]
        , div [ class "color-options" ]
            (List.map (renderColorDot model.selectedColor) [ "black", "navy", "olive", "rust" ])
        ]


renderColorDot : String -> String -> Html Msg
renderColorDot selected color =
    let
        border =
            if selected == color then
                "2px solid #000"
            else
                "1px solid #ccc"
    in
    span
        [ style "background-color" color
        , style "border" border
        , style "width" "20px"
        , style "height" "20px"
        , style "margin" "4px"
        , style "display" "inline-block"
        , style "border-radius" "50%"
        , style "cursor" "pointer"
        , onClick (SelectColor color)
        ]
        []


-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
