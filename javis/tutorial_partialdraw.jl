using Javis
video = Video(500, 500)

Background(1:120, (args...) -> begin
    background("black")
    sethue("white")
end)
circ = Object(1:120, (args...) -> circle(O, 100, :stroke))

action_showcreate = Action(1:60, showcreation())
act!(circ, action_showcreate)

render(video, pathname="createcircle.gif")
