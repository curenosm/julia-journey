using Javis, Animations, Colors

function ground(args...)
  background("black")
  sethue("white")
end

rotate_anim = Animation(
  [0, 1], # must go from 0 to 1
  [0, 2π],
  [sineio()],
)

translate_anim = Animation(
  [0, 1], # must go from 0 to 1
  [O, Point(150, 0)],
  [sineio()],
)

translate_back_anim = Animation(
  [0, 1], # must go from 0 to 1
  [O, Point(-150, 0)],
  [sineio()],
)

color_anim = Animation(
  [0, 0.5, 1], # must go from 0 to 1
  [Lab(colorant"red"), Lab(colorant"cyan"), Lab(colorant"black")],
  [sineio(), sineio()],
)

video = Video(600, 400)
Background(1:200, ground)

for frame_start = 1:10:50
  blob = Object(frame_start:frame_start+149, (args...) -> circle(O, 20, :fill))
  act!(blob, Action(1:10, sineio(), appear(:scale))) # new line
  act!(blob, Action(1:30, translate_anim, translate()))
  act!(blob, Action(31:120, rotate_anim, rotate_around(Point(-150, 0))))
  act!(blob, Action(121:150, translate_back_anim, translate()))
  act!(blob, Action(1:150, color_anim, sethue()))
end

render(video; pathname = "loading.gif")
