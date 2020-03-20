local results = util.table.deepcopy(data.raw["recipe"]["se-core-fragment-omni"].results)

function blacklist(data)
    -- List of bob's ores and fluids
    list = {
        "bauxite-ore",
        "cobalt-ore",
        "gem-ore",
        "gold-ore",
        "lead-ore",
        "nickel-ore",
        "quartz",
        "rutile-ore",
        "silver-ore",
        "thorium-ore",
        "tin-ore",
        "tungsten-ore",
        "zinc-ore",
        "ruby-ore",
        "sapphire-ore",
        "emerald-ore",
        "amethyst-ore",
        "topaz-ore",
        "diamond-ore",
        "pure-water",
        "lithia-water"
    }
    for _,item in pairs(list) do
        if data == item then
            return true
        end
    end
    return false
end

data.raw["recipe"]["se-core-fragment-omni"].results = {}
local products = {}

for _,result in pairs(results) do
    if not blacklist(result["name"]) then
        table.insert(products, result)
    end
end

data.raw["recipe"]["se-core-fragment-omni"].results = products
