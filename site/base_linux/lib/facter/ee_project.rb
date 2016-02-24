require 'facter'

Facter.add(:ee_project) do
  setcode do
    ee_project = nil
    if name = Facter::Util::Resolution.exec('hostname -f')
      if name =~ /\w+\.(\w+)/
        ee_project = $1
      else
        ee_project = name
      end
    end
    ee_project
  end
end
