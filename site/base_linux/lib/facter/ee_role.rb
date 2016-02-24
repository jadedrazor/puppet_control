require 'facter'

Facter.add(:ee_role) do
  setcode do
    ee_role = nil
    if name = Facter::Util::Resolution.exec('hostname -f')
      if name =~ /(.*?)\W/
        ee_role = $1
      else
        ee_role = name
      end
    end
    ee_role
  end
end
