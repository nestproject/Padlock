Pod::Spec.new do |spec|
  spec.name = '🔒'
  spec.version = '0.2.0'
  spec.summary = 'Nest middleware to 🔒 up your web application in HTTP auth.'
  spec.homepage = 'https://github.com/nestproject'
  spec.license = { :type => 'BSD', :file => 'LICENSE' }
  spec.author = { 'Kyle Fuller' => 'kyle@fuller.li' }
  spec.social_media_url = 'http://twitter.com/kylefuller'
  spec.source = { :git => 'https://github.com/nestproject/Padlock.git', :tag => "#{spec.version}" }
  spec.source_files = 'Padlock/Padlock.swift'
  spec.requires_arc = true
  spec.ios.deployment_target = '8.0'
  spec.osx.deployment_target = '10.9'
  spec.module_name = 'Padlock'
  spec.dependency 'Nest', '~> 0.2.0'
  spec.dependency 'Inquiline', '~> 0.2.0'
end

