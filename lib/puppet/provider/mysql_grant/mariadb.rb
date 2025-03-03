# frozen_string_literal: true
Puppet::Type.type(:mysql_grant).provide(
    :mariadb,
    :parent => Puppet::Type.type(:mysql_grant).provider(:mysql),
  ) do
  desc 'Set grants for users in MySQL.'

  commands mysql_raw: 'mariadb'
end
