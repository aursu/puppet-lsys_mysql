# frozen_string_literal: true

Puppet::Type.type(:mysql_user)
.provide(
  :mariadb,
  :parent => Puppet::Type.type(:mysql_user).provider(:mysql),
) do
  desc 'manage users for a mysql database.'

  commands mysql_raw: 'mariadb'
end
