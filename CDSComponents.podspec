Pod::Spec.new do |s|
  s.name             = 'CDSComponents'
  s.version          = '1.0.1'
  s.summary          = 'Desgin System Components for Carota App'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Carota-MarketPlanner/ios-cds-components'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elias Ferreira' => 'eliasferreira.pro@gmail.com' }
  s.source           = { :git => 'https://github.com/Carota-MarketPlanner/ios-cds-components', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  
  s.default_subspecs = "Binary"

  s.subspec 'Binary' do |release|
    release.vendored_frameworks = 'CDSComponents.framework'
  end

  s.subspec 'Source' do |debug|
    debug.source_files = 'CDSComponents/Classes/**/*'
  end
 
end
