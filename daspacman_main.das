require daslib/media
// options debugger            // uncomment for debug in VS Code
// require daslib/debug        // uncomment for debug in VS Code

let _ = 0
let W = 1
let o = 2
let O = 3

let field <- [{ auto[]
    [{ auto[] W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W }];
    [{ auto[] W; O; _; _; _; o; o; o; W; _; W; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; W; W; W; _; W; W; W; W; _; W; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; W; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; _; W }];
    [{ auto[] W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W; W }] 
}]

let imgEmpty <- create_image("cell_empty.png")
let imgWall <- create_image("cell_wall.png")
let imgDot <- create_image("cell_dot.png")
let imgVitamine <- create_image("cell_vitamine.png")

// 'initialize' runs once when game starts and every hot-reload
[export]
def initialize
    set_window_title("daspacman")
    set_resolution(768, 768)
    return

// this function is called to update game data,
// dt - time elapsed since the previous update (in seconds)
[export]
def act(dt: float)
    if get_key(VK_ESCAPE)
        schedule_quit_game()
    return

// this function will be called every frame after 'act',
// you can draw anything in this function
[export]
def draw
    for j in range(0, length(field))
        let line := field[j]
        for i in range(0, length(line))
            let cell = line[i]
            draw_image(cell == _ ? imgEmpty
                : cell == W ? imgWall
                : cell == o ? imgDot
                : imgVitamine, i * 32, j * 32)
            
    return
