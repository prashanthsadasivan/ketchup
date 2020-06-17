defmodule Ketchup.Service do
  def ping() do
    doc_idx = :riak_core_util.chash_key({"ping", :erlang.term_to_binary(:os.timestamp())})
    pref_list = :riak_core_apl.get_primary_apl(doc_idx, 1, Ketchup.Service)
    [{index_node, _type}] = pref_list
  # riak core appends "_master" to Ketchup.Vnode.
    :riak_core_vnode_master.sync_spawn_command(index_node, :ping, Ketchup.Vnode_master)
  end

end
