# frozen_string_literal: true

Puppet::Type.type(:mysql_database).provide(
  :mariadb,
  parent: Puppet::Type.type(:mysql_database).provider(:mysql),
) do
  desc 'Manages MySQL databases.'

  commands mysql_raw: 'mariadb'
end
