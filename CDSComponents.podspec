Pod::Spec.new do |s|
  s.name             = 'CDSComponents'
  s.version          = '1.3.0'
  s.summary          = 'Desgin System Components for Carota App'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Carota-MarketPlanner/ios-cds-components.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Elias Ferreira' => 'eliasferreira.pro@gmail.com' }
  s.source           = { :http => "https://github.com/Carota-MarketPlanner/ios-cds-components/releases/download/#{s.version}/CDSComponents-#{s.version}.zip" }

  s.platforms = { :ios => '15.0'}
  
  s.ios.deployment_target = '15.0'

  s.vendored_frameworks = 'CDSComponents.xcframework'
  s.source_files = 'CDSComponents/Classes/**/*'
 
end
