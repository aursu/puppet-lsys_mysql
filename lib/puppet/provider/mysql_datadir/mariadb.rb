# frozen_string_literal: true

Puppet::Type.type(:mysql_datadir).provide(
  :mariadb,
  parent: Puppet::Type.type(:mysql_database).provider(:mysql),
) do
  desc 'manage data directories for mysql instances'

  commands mysqld: 'mariadbd'
  optional_commands mysql_install_db: 'mariadb-install-db'
end
