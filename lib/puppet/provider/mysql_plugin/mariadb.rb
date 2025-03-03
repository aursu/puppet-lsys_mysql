# frozen_string_literal: true

Puppet::Type.type(:mysql_plugin).provide(
  :mariadb,
  parent: Puppet::Type.type(:mysql_plugin).provider(:mysql),
) do
  desc 'Manages MySQL plugins.'

  commands mariadb_raw: 'mariadb'

  def self.mysql_caller(text_of_sql, type)
    if type.eql? 'system'
      if File.file?("#{Facter.value(:root_home)}/.mylogin.cnf")
        ENV['MYSQL_TEST_LOGIN_FILE'] = "#{Facter.value(:root_home)}/.mylogin.cnf"
        mariadb_raw([system_database, '-e', text_of_sql].flatten.compact).scrub
      else
        mariadb_raw([defaults_file, system_database, '-e', text_of_sql].flatten.compact).scrub
      end
    elsif type.eql? 'regular'
      if File.file?("#{Facter.value(:root_home)}/.mylogin.cnf")
        ENV['MYSQL_TEST_LOGIN_FILE'] = "#{Facter.value(:root_home)}/.mylogin.cnf"
        mariadb_raw(['-NBe', text_of_sql].flatten.compact).scrub
      else
        mariadb_raw([defaults_file, '-NBe', text_of_sql].flatten.compact).scrub
      end
    else
      raise Puppet::Error, _("#mysql_caller: Unrecognised type '%{type}'" % { type: type })
    end
  end
end
