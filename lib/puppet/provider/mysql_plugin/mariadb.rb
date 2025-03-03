# frozen_string_literal: true
Puppet::Type.type(:mysql_plugin)
  .provide(
    :mariadb,
    :parent => Puppet::Type.type(:mysql_plugin).provider(:mysql),
  ) do
  desc 'Manages MySQL plugins.'

  commands mysql_raw: 'mariadb'
end
