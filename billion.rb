class Billion < Oxidized::Model
  prompt /\s>\s$/
  cmd 'dumpcfg' do |cfg|
    cfg.gsub! /^dump bytes allocated=\d+ used=\d+ > $/, ''
    cfg.gsub! /^dumpcfg$/, ''
    cfg.gsub! /<SESSION_ID>[a-f0-9]+\/[a-f0-9]+<\/SESSION_ID>$/, '<SESSION_ID>trimmed</SESSION_ID>'
    cfg.gsub! /<PeriodicInformTime>.*<\/PeriodicInformTime>$/, '<PeriodicInformTime>1970-01-01T00:00:00+00:00</PeriodicInformTime>'
  end

  cfg :ssh do
    pre_logout 'exit'
  end
end
