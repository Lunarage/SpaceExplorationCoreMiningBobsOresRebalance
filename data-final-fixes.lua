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

data.raw["recipe"]["se-core-fragment-omni"].results = {}
local products = {}

for _,result in pairs(results) do
    if inList(result["name"]) then
        table.insert(products, result)
    end
end

data.raw["recipe"]["se-core-fragment-omni"].results = products
