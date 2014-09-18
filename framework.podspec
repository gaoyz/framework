Pod::Spec.new do |s|
  s.name = 'framework'
  s.platform = :ios, '6.0'
  s.version = '0.5'
  s.summary = 'Bee Framework is a rapid developemnt framework for iOS.'
  s.description = 'Bee Framework is a MVC Framework to develop iOS application. \n    It has pretty clear hieracy and signal based mechanism, also with cache and asynchonized networking methods in it.\n'
  s.homepage = 'http://bee-framework.com'
  s.author = { 'gavinkwoe' => 'gavinkwoe@gmail.com' }
  s.license = 'MIT'
  s.source = {
    :git => 'https://github.com/gaoyz/framework.git',
    :tag => s.version.to_s
  }
  s.libraries = 'z', 'xml2', 'sqlite3'
  s.vendored_libraries = 'services/**/*.a'
  s.requires_arc = false
  s.frameworks = 'CoreMedia', 'CoreVideo', 'AVFoundation', 'Security', 'SystemConfiguration', 'QuartzCore', 'MobileCoreServices', 'CFNetwork'

  s.subspec 'JSONKit' do |sp|
    sp.source_files = 'framework/vendor/JSONKit/JSONKit.{h,m}'
    sp.requires_arc = false
  end

  s.subspec 'blur' do |sp|
    sp.source_files = 'framework/vendor/blur/JCRBlurView.{h,m}'
  end

  s.subspec 'Log4Cocoa' do |sp|
    sp.source_files = 'framework/vendor/Log4Cocoa/*.{h,m}'
  end

  s.subspec 'MMDrawerController' do |sp|
    sp.source_files = 'framework/vendor/MMDrawerController/*.{h,m}'
  end

  s.subspec 'NGVolume' do |sp|
    sp.source_files = 'framework/vendor/NGVolume/*.{h,m}'
    sp.resource = 'framework/vendor/NGVolume/NGVolumeControl.bundle'
  end

  s.subspec 'Reader' do |sp|
    sp.source_files = 'framework/vendor/Reader/*.{h,m}'
    sp.resource = 'framework/vendor/Reader/ReaderGraphics.bundle'
  end
  
  s.subspec 'RegexOnNSString' do |sp|
    sp.source_files = 'framework/vendor/RegexOnNSString/*.{h,m}'
  end 
  
  s.subspec 'SIAlertView' do |sp|
    sp.source_files = 'framework/vendor/SIAlertView/*.{h,m}'
    sp.resource = 'framework/vendor/SIAlertView/SIAlertView.bundle'
  end
  
  s.subspec 'Toast' do |sp|
    sp.source_files = 'framework/vendor/Toast/*.{h,m}'
    sp.requires_arc = false
  end

  s.subspec 'UMAnalytics_Sdk_2.2.1.OpenUDID' do |sp|
    sp.source_files = 'framework/vendor/UMAnalytics_Sdk_2.2.1.OpenUDID/*.h'
    sp.vendored_libraries = 'framework/vendor/UMAnalytics_Sdk_2.2.1.OpenUDID/*.a'
  end

  s.subspec 'Core' do |sp|
    sp.resources = 'services/**/*.{xml, bundle}'
    sp.source_files = 'framework/**/*.{h,m,mm}', 'services/**/*.{h,m,mm}', 'framework/vendor/*.{h,m}'
    sp.exclude_files = 'framework/vendor/{ASI,ZipArchive,FMDB,JSONKit,OpenUDID,Reachability,TouchXML,blur,Log4Cocoa,MMdrawerController,NGVolume,Reader,RegexOnNSString,SIAlertView,Toast,UMAnalytics_Sdk_2.2.1.OpenUDID}/**/*'
    sp.requires_arc = false
    sp.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libz, $(SDKROOT)/usr/include/libxml2', 'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++0x', 'CLANG_CXX_LIBRARY' => 'libstdc++', 'CLANG_WARN_DIRECT_OBJC_ISA_USAGE' => 'YES'}
    sp.dependency = 'ASIHTTPRequest'
    sp.dependency = 'Reachability'
    sp.dependency = 'OpenUDID'
    sp.dependency = 'ZipArchive'
    sp.dependency = 'FMDB'
    sp.dependency = 'TouchXML'
    sp.dependency = 'BeeFramework/JSONKit'
  end
end