using Agents

properties = Dict(:min_to_be_happy => 3)

model = AgentBasedModel(Schelling, space; properties)

function initialize(; N=320, M=20, min_to_be_happy=3)
    space = GridSpace((10, 10))
    scheduler = Schedulers.randomly
    properties = Dict(:min_to_be_happy => min_to_be_happy)
    model = AgentBasedModel(Schelling, space; properties, scheduler)

    # Agregamos los agentes
    for n in 1:N
        agent = Schelling(n, (1, 1), n < N / 2 ? 1 : 2, false)
        add_agent_simple!(model, agent)
    end

    return model
end

model = initialize()

function agent_step!(agent, model)
    agent.happy && return
    #=
    if agent.happy
        return
    end
    =#
    nearby_same = 0

    for neighbor in nearby_agents(agent, model)
        if agent.group == neighbor.group
            nearby_same += 1
        end
    end

    if nearby_same >= model.min_to_be_happy
        agent.happy = true
    else
        move_agent_single!(agent, model)
    end

    return
end

step!(model, agent_step!)

# step!(model, agent_step!, 3)

# dummystep : Stepping function for the model
# step!(model, agent_step!, dummystep, 3)

t(model, s) = s == 3
model = initialize()
step!(model, agent_step!, dummystep, t)

using InteractiveDynamics, GLMakie
fig, _ = abm_plot(model)
display(fig)

groupcolor(agent) = agent.group == 1 ? :blue : :orange
groupmarker(agent) = agent.group == 1 ? :circle : :rect

fig, _ = abm_plot(model; ac=groupcolor, am=groupmarker)
display(fig)

model = initialize()
abm_play(
    model, agent_step!;
    ac=groupcolor, am=groupmarker, as=12
)


### Step 6: Recolectar datos

adata = [:group, :happy]
adf, _ = run!(model, agent_step!, dummystep, 3; adata)

x(agent) = agents.pos[1]

adata = agents.pos[:group, :happy, x]
models = initialize()
adf, _ = run!(model, agent_step!, dummystep, 3; adata)

using Statistics: mean

adata = [
    (:happy, sum),
    (x, mean)
]

models = initialize()
adf, _ = run!(model, agent_step!, dummystep, 3; adata)
