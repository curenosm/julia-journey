module TransformationService

using LinearAlgebra

export transform_data_inplace

function transform_data_inplace(data)
    data .+ 1
end

end