using Javis
using Animations

function ground(args...)
    background("black") # canvas background
    sethue("white") # pen color
end

function path!(points, pos, color)
    sethue(color)
    push!(points, pos) # add pos to points
    circle.(points, 2, :fill) # draws a circle for each point using broadcasting
end

function dancing_circles(c1, c2, start_pos=O)
    path_of_red = Point[]
    path_of_blue = Point[]

    red_ball = Object(JCircle(O, 25, color=c1, action=:fill), start_pos + (100, 0))
    act!(red_ball, Action(anim_rotate_around(2π, start_pos)))
    blue_ball = Object(JCircle(O, 25, color=c2, action=:fill), start_pos + (200, 80))
    act!(blue_ball, Action(anim_rotate_around(2π, 0.0, red_ball)))
    Object(@JShape begin
        path!(path_of_red, pos(red_ball), c1)
    end)
    Object(@JShape begin
        path!(path_of_blue, pos(blue_ball), c2)
    end)
end

finalvideo = Video(500, 500)

Background(1:140, ground)

colors = [
    ["red", "green"],
    ["orange", "blue"],
    ["yellow", "purple"],
    ["greenyellow", "darkgoldenrod1"],
]

final_points = [Point(-150, -150), Point(150, -150), Point(150, 150), Point(-150, 150)]

planets = map(colors) do c
    @JLayer 1:140 begin
        dancing_circles(c...)
    end
end

anim_back_and_forth = map(final_points) do point
    Animation([0.0, 1 / 2, 1.0], [O, point, O], [sineio(), sineio()])
end

for (animation, pl) in zip(anim_back_and_forth, planets)

    # Scale the layers
    act!(pl, Action(1:1, anim_scale(0.4)))

    # Move them around
    act!(pl, Action(1:140, animation, translate()))
end

render(finalvideo; pathname="tutoral_8.gif")
