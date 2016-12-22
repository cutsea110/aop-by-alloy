module Hotel

open util/ordering[Time]
open util/ordering[Key]

sig Key{}
sig Time{}

sig Room {
	keys: set Key,
	currentKey: keys one -> Time
}

fact DisjointKeySets {
	Room <: keys in Room lone -> Key
}

one sig FrontDesk {
	lastKey: (Room -> lone Key) -> Time,
	occupant: (Room -> Guest) -> Time
}

sig Guest {
	keys: Key -> Time
}

fun nextKey (k: Key, ks: set Key) : lone Key {
	min [k.nexts & ks]
}

pred init (t: Time) {
	no Guest.keys.t
	no FrontDesk.occupant.t
	all r: Room | FrontDesk.lastKey.t[r] = r.currentKey.t
}

pred entry (t, t': Time, g: Guest, r: Room, k: Key) {
	k in g.keys.t
	let ck = r.currentKey |
		(k = ck.t and ck.t' = ck.t) or
		(k = nextKey[ck.t, r.keys] and ck.t' = k)
	noRoomChangeExcept[t, t', r]
	noGuestChangeExcept[t,t',none]
	noFrontDeskChange[t,t']
}
