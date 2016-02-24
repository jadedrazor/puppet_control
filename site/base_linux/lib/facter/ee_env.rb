require 'facter'

Facter.add(:ee_env) do
  setcode do
    ee_env = nil
    if name = Facter::Util::Resolution.exec('hostname -f')
      if name =~ /\w+\.\w+\.(\w+)/
        ee_env = $1
      else
        ee_env = name
      end
    end
    ee_env
  end
end
