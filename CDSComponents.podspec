Pod::Spec.new do |s|
  s.name             = 'CDSComponents'
  s.version          = '1.0.3'
  s.summary          = 'Desgin System Components for Carota App'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Carota-MarketPlanner/ios-cds-components.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elias Ferreira' => 'eliasferreira.pro@gmail.com' }
  s.source           = { :git => 'https://github.com/Carota-MarketPlanner/ios-cds-components.git', :tag => s.version.to_s }

  s.platforms = { :ios => '15.0'}
  s.ios.deployment_target = '15.0'
  
  s.pod_target_xcconfig = { "ENABLE_BITECODE" => "NO", "SKIP_INSTALL" => "NO" }
  
  s.default_subspecs = "Binary"

  s.subspec 'Binary' do |release|
    release.vendored_frameworks = 'Release/CDSComponents.xcframework'
  end

  s.subspec 'Source' do |debug|
    debug.source_files = 'CDSComponents/Classes/**/*'
  end
 
end
