using Base.Test

import limiting_distance

@test limiting_distance(10,12.4,34.0) == "The tree is in"
