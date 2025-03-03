# frozen_string_literal: true
Puppet::Type.type(:mysql_database).provide(
  :mariadb,
  # set ini_setting as the parent provider
  :parent => Puppet::Type.type(:mysql_database).provider(:mysql), # rubocop:disable Style/HashSyntax
) do
  desc 'Manages MySQL databases.'

  commands mysql_raw: 'mariadb'
end
