local results = util.table.deepcopy(data.raw["recipe"]["se-core-fragment-omni"].results)

function inList(data)
    list = {"iron-ore","copper-ore","stone","crude-oil"}
    for _,item in pairs(list) do
        if data == item then
            return true
        end
    end
    return false
end

function blacklist(data)
    -- List of bob's ores
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
        "tungsten-ore",
        "zinc-ore"
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
