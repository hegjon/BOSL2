include <BOSL2/std.scad>
include <BOSL2/skin.scad>


module test_skin() {
    profiles = [
        [[-100,-100,0], [0,100,0], [100,-100,0]],
        [[-100,-100,100], [-100,100,100], [100,100,100], [100,-100,100]],
    ];
    vnf1 = skin(profiles, slices=0, caps=false, method="distance");
    assert_equal(vnf1, [[[-100,-100,0],[0,100,0],[0,100,0],[100,-100,0],[-100,-100,100],[-100,100,100],[100,100,100],[100,-100,100]],[[0,5,4],[0,1,5],[1,6,5],[1,2,6],[2,3,6],[3,7,6],[3,4,7],[3,0,4]]]);
    vnf2 = skin(profiles, slices=0, caps=true, method="distance");
    assert_equal(vnf2, [[[-100,-100,0],[0,100,0],[0,100,0],[100,-100,0],[-100,-100,100],[-100,100,100],[100,100,100],[100,-100,100]],[[0,5,4],[0,1,5],[1,6,5],[1,2,6],[2,3,6],[3,7,6],[3,4,7],[3,0,4],[3,2,1,0],[4,5,6,7]]]);
    vnf_polyhedron(vnf2);
}
test_skin();


// vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
