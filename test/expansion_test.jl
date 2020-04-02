using ForestBiometrics

tl1 = [
Tree(10.0,65,"WO",1.0),
Tree(10.0,65,"WO",1.0),
Tree(10.0,65,"WO",1.0),
Tree(10.0,65,"WO",1.0)]

tl2 = [
Tree(10.0,65,"WO",1.0),
Tree(10.0,60,"WO",1.0),
Tree(10.0,65,"WO",1.0),
Tree(10.0,65,"WO",1.0)]

tl3 = [
Tree(10.0,65,"WO",1.0),
Tree(10.0,60,"WO",1.0),
Tree(10.0,60,"WO",1.0),
Tree(10.0,65,"WO",1.0),
Tree(10.0,70,"WO",1.0)]

@test length(collapse(tl1)) == 1
@test length(collapse(tl2)) == 2
@test length(collapse(tl3)) == 3

t1 = Tree(12.0,65,"WO",4.25)
t2 = Tree(12.0,65,"WO",10)

tl4 = [Tree(12.0,60,"WO",5),
Tree(10.0,65,"WO",5),
Tree(12.0,60,"WO",1),
Tree(10.0,65,"WO",1)]

@test length(expand(t1)) == 5
@test length(expand(t1, min_exp = 2)) == 3
@test length(expand(tl4)) == 12

@test length(t2 / 3.0) == 3

s1 = Stand(tl4)
expand!(s1)

@test length(s1.treelist) == 12
