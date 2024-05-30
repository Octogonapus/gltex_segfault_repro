using JSON, FileIO, Makie, GLMakie

while true
    for i = 1:10
        figure = Makie.Figure(size = (850, 800))
        axis = Makie.Axis(figure)
        figure[1, 1] = axis
        Makie.lines!(axis, [0, 1], [0, 1], linestyle = :dash)
        FileIO.save("$(tempname()).png", figure)
        
        figure = Makie.Figure(size = (850, 800))
        axis = Makie.Axis(figure)
        figure[1, 1] = axis
        Makie.lines!(axis, [0, 1], [0, 1], linestyle = :dash)
        FileIO.save("$(tempname()).png", figure)
    end

    Threads.@threads for i = 1:16
        JSON.parsefile("foo.json")
    end
end
