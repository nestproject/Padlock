Pod::Spec.new do |spec|
  spec.name = '🔒'
  spec.version = '0.1.0'
  spec.summary = 'Nest middleware for 🔒 up your web application in HTTP auth.'
  spec.homepage = 'https://github.com/nestproject'
  spec.license = { :type => 'BSD', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'kyle@fuller.li' }
  spec.social_media_url = 'http://twitter.com/kylefuller'
  spec.source = { :git => 'https://github.com/nestproject/Padlock.git', :tag => "#{spec.version}" }
  spec.source_files = 'Padlock/Padlock.swift'
  spec.requires_arc = true
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.dependency 'Nest', '~> 0.1.0'
end

