use Mix.Config

config :riak_core,
  ring_state_dir: 'ring_state_dir',
  handoff_port: 8099,
  handoff_ip: '127.0.0.1',
  schema_dirs: ['priv'],
  ring_creation_size: 12,
  vnode_inactivity_timeout: 1000

config :lager,
  colored: true,
  error_logger_hwm: 500

config :sasl,
  errlog_type: :error
