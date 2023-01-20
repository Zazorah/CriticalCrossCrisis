
// Create explosion
var e = instance_create_depth(x, y, depth, par_Explosion);
e.length = owner.fire_count;

// Remove self from owner's bomb list
with(owner) {
    ds_list_delete(bombs, ds_list_find_index(bombs, other.id));
}